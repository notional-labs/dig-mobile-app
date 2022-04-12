import 'package:bloc/bloc.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/proposals_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'proposals_state.dart';

@injectable
class ProposalsCubit extends Cubit<ProposalsState> {
  final GetProposalsUseCase _getProposalsUseCase = di();

  ProposalsCubit() : super(ProposalsInitial());

  Future getProposals() async {
    emit(ProposalsLoadingState(model: state.model));
    final result = await _getProposalsUseCase
        .call(const GetProposalsUseCaseParam(request: ProposalsRequest()));
    result.fold(_handleGetProposalsFailure, _handleGetProposalsSuccess);
  }

  void _handleGetProposalsSuccess(List<Proposal> proposals) {
    emit(ProposalsPrimaryState(
        model: state.model.copyWith(proposals: proposals.reversed.toList())));
  }

  void _handleGetProposalsFailure(BaseDigException exception) {
    emit(ProposalsErrorState(exception: exception, model: state.model));
  }
}
