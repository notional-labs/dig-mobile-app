import 'package:dig_core/src/domain/entity/staking/delegations/delegations_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegations_request.dart';
import 'package:dig_core/src/domain/env/env.dart';

abstract class DelegationRepository {
  ChainENV createChainENV(ChainENV chain);

  Future<DelegationsResponse> getDelegations(GetDelegationsRequest request);
}
