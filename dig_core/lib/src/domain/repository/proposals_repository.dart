import 'package:dig_core/src/domain/entity/proposals/proposals_request.dart';
import 'package:dig_core/src/domain/entity/proposals/proposals_response.dart';
import 'package:dig_core/src/domain/env/env.dart';

abstract class ProposalsRepository {
  ChainENV createChainENV(ChainENV chain);
  Future<ProposalsResponse?> getProposals(ProposalsRequest param);
}
