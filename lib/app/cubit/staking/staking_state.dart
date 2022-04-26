import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_viewmodel.dart';
import 'package:equatable/equatable.dart';

abstract class StakingState extends Equatable {
  final StakingViewmodel viewmodel;
  const StakingState({this.viewmodel = const StakingViewmodel()});

  @override
  List<Object?> get props => [viewmodel];
}

class StakingLoadingState extends StakingState {
  const StakingLoadingState(
      {StakingViewmodel viewmodel = const StakingViewmodel()})
      : super(viewmodel: viewmodel);
}

class StakingPrimaryState extends StakingState {
  const StakingPrimaryState(
      {StakingViewmodel viewmodel = const StakingViewmodel()})
      : super(viewmodel: viewmodel);
}

class StakingErrorState extends StakingState {
  final BaseDigException exception;
  const StakingErrorState(
      {this.exception = const DigException(),
      StakingViewmodel viewmodel = const StakingViewmodel()})
      : super(viewmodel: viewmodel);

  @override
  List<Object?> get props => [exception, viewmodel];
}