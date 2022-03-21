import 'package:alan/wallet/network_info.dart';

abstract class ChainENV {
  String get lcdUrl;
  int get lcdPort;
  String get grpcUrl;
  int get grpcPort;
  String get baseApiUrl;
  String get bech32Hrp;
  String get chainId;
  NetworkInfo get networkInfo;
}