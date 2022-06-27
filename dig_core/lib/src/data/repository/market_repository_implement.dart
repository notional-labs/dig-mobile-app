import 'package:dig_core/src/data/datasource/remote/market_remote_datasource.dart';
import 'package:dig_core/src/domain/entity/coin_request.dart';
import 'package:dig_core/src/domain/entity/staking/market.dart';
import 'package:dig_core/src/domain/repository/market_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MarketRepository)
class MarketRepositoryImplement implements MarketRepository {
  final MarketRemoteDatasource _datasource;
  MarketRepositoryImplement(this._datasource);

  @override
  Future<List<Market>> getCoin(CoinRequest param) => _datasource.getCoin(param);
}
