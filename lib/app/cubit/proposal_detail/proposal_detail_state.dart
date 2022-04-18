part of 'proposal_detail_cubit.dart';

@immutable
abstract class ProposalDetailState with EquatableMixin {
  final ProposalDetailViewModel model;

  ProposalDetailState({required this.model});

  @override
  List<Object?> get props => [model];
}

class ProposalDetailInitial extends ProposalDetailState {
  ProposalDetailInitial() : super(model: const ProposalDetailViewModel());
}

class ProposalDetailPrimaryState extends ProposalDetailState {
  ProposalDetailPrimaryState({required ProposalDetailViewModel model})
      : super(model: model);
}
