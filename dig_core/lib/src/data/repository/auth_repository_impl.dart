import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/domain/model/create_mnemonic.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:transaction_signing_gateway/alan/alan_account_derivation_info.dart';
import 'package:transaction_signing_gateway/mobile/no_op_transaction_summary_ui.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

@Injectable(as: AuthRepository)
class AuthRepisitoryImplement extends AuthRepository {
  ChainENV? _chain;
  TransactionSigningGateway? _transactionSigningGateway;

  @override
  ChainENV createChainENV(ChainENV chain) {
    _chain = chain;
    return _chain!;
  }

  @override
  TransactionSigningGateway createTransactionSigningGateway() {
    assert(_chain != null,
        "`_chain` must be not null. Ensure called `createChainENV` first");
    _transactionSigningGateway ??= TransactionSigningGateway(
      transactionSummaryUI: NoOpTransactionSummaryUI(),
      signers: [
        AlanTransactionSigner(_chain!.networkInfo),
      ],
      broadcasters: [
        AlanTransactionBroadcaster(_chain!.networkInfo),
      ],
      infoStorage: CosmosKeyInfoStorage(
        serializers: [AlanCredentialsSerializer()],
        secureDataStore: FlutterSecureStorageDataStore(),
        plainDataStore: SharedPrefsPlainDataStore(),
      ),
    );

    return _transactionSigningGateway!;
  }

  @override
  Future<String> createMnemonic(CreateMnemonic param) async {
    param.onMnemonicGenerationStarted?.call();
    return await generateMnemonic(strength: param.strength);
  }

  @override
  Future<AccountPublicInfo> importAccount(ImportAccount param) async {
    assert(_chain != null,
        "`_chain` must be not null. Ensure called `createChainENV` first");
    final result = await createTransactionSigningGateway()
        .deriveAccount(
      accountDerivationInfo: AlanAccountDerivationInfo(
        accountAlias: param.importAccountFormData.name,
        networkInfo: _chain!.networkInfo,
        mnemonic: param.importAccountFormData.mnemonic,
        chainId: _chain!.chainId,
      ),
    )
        .mapError<dynamic>((fail) {
      return fail;
    }).flatMap(
      (credentials) {
        return createTransactionSigningGateway()
            .storeAccountCredentials(
          credentials: credentials,
          password: param.importAccountFormData.password,
        )
            .flatMap(
          (_) async {
            return createTransactionSigningGateway().updateAccountPublicInfo(
              info: credentials.publicInfo.copyWith(
                additionalData:
                    param.importAccountFormData.additionalData.toJsonString(),
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
        throw fail;
      },
      (credentials) {
        return credentials.publicInfo;
      },
    );
  }
}
