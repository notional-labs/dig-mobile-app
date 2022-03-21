import 'package:alan/wallet/network_info.dart';
import 'package:dig_core/src/cosmos/util/cosmos_configs.dart';
import 'package:grpc/grpc.dart';

class BaseEnv {
  BaseEnv({
    String? lcdUrl,
    String? grpcUrl,
    String? lcdPort,
    String? grpcPort,
  })  : networkInfo = NetworkInfo(
          bech32Hrp: CosmosConfigs.bech32Hrp,
          lcdInfo: LCDInfo(
            host: lcdUrl ?? envLcdUrl,
            port: int.parse(lcdPort ?? envLcdPort),
          ),
          grpcInfo: GRPCInfo(
            host: grpcUrl ?? envGrpcUrl,
            port: _parseGrpcPort(grpcPort),
            credentials: _parseGrpcPort(grpcPort) == 443
                ? const ChannelCredentials.secure()
                : const ChannelCredentials.insecure(),
          ),
        ),
        baseApiUrl = '${lcdUrl ?? envLcdUrl}:${lcdPort ?? envLcdPort}';

  static int _parseGrpcPort(String? grpcPort) =>
      int.parse(grpcPort ?? envGrpcPort);

  final NetworkInfo networkInfo;

  final String baseApiUrl;
}

String get envLcdPort =>
    const String.fromEnvironment('LCD_PORT', defaultValue: '443');

String get envGrpcPort =>
    const String.fromEnvironment('GRPC_PORT', defaultValue: '2222');

String get envLcdUrl {
  const result = String.fromEnvironment('LCD_URL');
  if (result.isEmpty) {
    return 'https://api-1-dig.notional.ventures';
  }
  return result;
}

String get envGrpcUrl {
  const result = String.fromEnvironment('GRPC_URL');
  if (result.isEmpty) {
    return 'https://188.40.72.115';
  }
  return result;
}
