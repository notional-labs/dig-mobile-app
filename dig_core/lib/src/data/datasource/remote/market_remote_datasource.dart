import 'package:dig_core/src/data/network/coingecko_rest_client.dart';
import 'package:dig_core/src/domain/entity/coin_request.dart';
import 'package:dig_core/src/domain/entity/staking/market.dart';
import 'package:injectable/injectable.dart';

abstract class MarketRemoteDatasource {
  Future<List<Market>> getCoin(CoinRequest param);
}

@Injectable(as: MarketRemoteDatasource)
class MarketRemoteDatasourceImplemet implements MarketRemoteDatasource {
  final CoingeckoRestClient _client;

  MarketRemoteDatasourceImplemet(this._client);

  @override
  Future<List<Market>> getCoin(CoinRequest param) =>
      _client.getBalances(ids: param.ids, vs_currency: param.vs_currency);
}
