import 'package:dig_core/src/domain/entity/coin_request.dart';
import 'package:dig_core/src/domain/entity/staking/market.dart';

abstract class MarketRepository {
  Future<List<Market>> getCoin(CoinRequest param);
}
