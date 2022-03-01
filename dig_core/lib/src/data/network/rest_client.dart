import 'package:dig_core/src/data/network/env.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(parser: Parser.JsonSerializable, autoCastResponse: true)
abstract class RestClient {
  @factoryMethod
  factory RestClient.from(Dio dio, ENV env) =>
      _RestClient(dio, baseUrl: env.baseUrl);
}
