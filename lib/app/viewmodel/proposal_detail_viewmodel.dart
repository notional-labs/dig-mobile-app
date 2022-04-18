import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

class ProposalDetailViewModel with EquatableMixin {
  final Proposal proposal;

  const ProposalDetailViewModel({this.proposal = const Proposal()});

  ProposalDetailViewModel copyWith({Proposal? proposal}) =>
      ProposalDetailViewModel(proposal: proposal ?? this.proposal);

  int get totalDeposit {
    final balance = proposal.totalDeposit
        .firstWhereOrNull((element) => Denom.udig == element.denom);
    return (double.tryParse(balance?.amount ?? '') ?? 0) ~/
        TokenBalanceRatio.ratio;
  }

  @override
  List<Object?> get props => [proposal];
}
