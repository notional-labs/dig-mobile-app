import 'package:bloc/bloc.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/proposal_detail_viewmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'proposal_detail_state.dart';

@Injectable()
class ProposalDetailCubit extends Cubit<ProposalDetailState> {
  late final Proposal _proposal;

  ProposalDetailCubit() : super(ProposalDetailInitial());

  void init(Proposal? proposal) {
    _proposal = proposal ?? const Proposal();
    emit(ProposalDetailPrimaryState(
        model: state.model.copyWith(proposal: _proposal)));
  }
}
