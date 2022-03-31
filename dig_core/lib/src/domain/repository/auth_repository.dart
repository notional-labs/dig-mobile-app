import 'package:dig_core/src/data/network/chain/chain_env.dart';
import 'package:dig_core/src/domain/model/create_mnemonic.dart';
import 'package:dig_core/src/domain/model/import_account.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

/// Support authencation for multichain
abstract class AuthRepository {
  ChainENV createChainENV(ChainENV chain);

  TransactionSigningGateway createTransactionSigningGateway();

  Future<String> createMnemonic(CreateMnemonic param);

  Future<AccountPublicInfo> importAccount(ImportAccount param);

  Future<List<AccountPublicInfo>> getAccountList();

  Future createPin(String pin);

  Future<bool> matchPin(String pin);

  Future<bool> checkHasPin();

  Future changePin(String pin);
  
  Future deletePin();
}
