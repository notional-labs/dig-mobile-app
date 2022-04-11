import 'package:dig_core/src/data/definition/definition.dart';
import 'package:dig_core/src/domain/entity/balance_response.dart';
import 'package:dig_core/src/domain/entity/proposals/proposals_response.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(parser: Parser.JsonSerializable, autoCastResponse: true)
abstract class RestClient {
  factory RestClient.from(Dio dio, ChainENV baseUrl) =>
      _RestClient(dio, baseUrl: baseUrl.baseApiUrl);

  @GET(EndPoint.getBalancePath)
  Future<BalanceResponse> getBalances(
      {@Path('address') required String address,
      @Query('pagination.key') String? nextPageKey,
      @Query('pagination.limit') int limit = 15});

  @GET(EndPoint.getProposals)
  Future<ProposalsResponse> getProposals(
      {@Query('pagination.key') String? nextPageKey,
      @Query('pagination.limit') int limit = 0}); // todo support paging later
}
