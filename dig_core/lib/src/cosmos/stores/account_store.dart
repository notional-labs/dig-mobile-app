import 'package:dig_core/src/cosmos/model/account_additional_data.dart';
import 'package:dig_core/src/cosmos/model/import_account_form_data.dart';
import 'package:dig_core/src/cosmos/util/base_env.dart';
import 'package:dig_core/src/cosmos/util/cosmos_configs.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:transaction_signing_gateway/alan/alan_account_derivation_info.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';
import 'package:cosmos_utils/cosmos_utils.dart';

@Injectable()
class AccountsStore {
  final TransactionSigningGateway _transactionSigningGateway;
  final BaseEnv _baseEnv;

  AccountsStore(this._transactionSigningGateway, this._baseEnv);

  Future<String?> createMnemonic({
    int strength = 128,
    VoidCallback? onMnemonicGenerationStarted,
  }) async {
    String? mnemonic;
    onMnemonicGenerationStarted?.call();
    try {
      mnemonic = await generateMnemonic(strength: strength);
    } catch (ex, stack) {
      logError(ex, stack);
    }
    return mnemonic;
  }

  Future<AccountPublicInfo?> createNewAccount({
    required String password,
    required bool isBackedUp,
    required String accountName,
    VoidCallback? onMnemonicGenerationStarted,
    VoidCallback? onAccountCreationStarted,
  }) async {
    final mnemonic = await createMnemonic(
        onMnemonicGenerationStarted: onMnemonicGenerationStarted);
    if (mnemonic == null) {
      return null;
    }
    return importAlanAccount(
      ImportAccountFormData(
        mnemonic: mnemonic,
        name: accountName,
        additionalData: AccountAdditionalData(isBackedUp: isBackedUp),
        password: password,
      ),
      onAccountCreationStarted: onAccountCreationStarted,
    );
  }

  Future<AccountPublicInfo?> importAlanAccount(
    ImportAccountFormData data, {
    VoidCallback? onAccountCreationStarted,
  }) async {
    final result = await _transactionSigningGateway
        .deriveAccount(
      accountDerivationInfo: AlanAccountDerivationInfo(
        accountAlias: data.name,
        networkInfo: _baseEnv.networkInfo,
        mnemonic: data.mnemonic,
        chainId: CosmosConfigs.chainId,
      ),
    )
        .mapError<dynamic>((fail) {
      return fail;
    }).flatMap(
      (credentials) {
        return _transactionSigningGateway
            .storeAccountCredentials(
          credentials: credentials,
          password: data.password,
        )
            .flatMap(
          (_) async {
            return _transactionSigningGateway.updateAccountPublicInfo(
              info: credentials.publicInfo.copyWith(
                additionalData: data.additionalData.toJsonString(),
              ),
            );
          },
        ).mapSuccess((_) {
          return credentials;
        });
      },
    );

    return result.fold(
      (fail) {
        logError(fail);
        return null;
      },
      (credentials) {
        return credentials.publicInfo;
      },
    );
  }
}
