
part of 'active_account_cubit.dart';

abstract class ActiveAccountState extends Equatable {
  final ActiveAccountViewModel viewmodel;

  const ActiveAccountState({this.viewmodel = const ActiveAccountViewModel()});

  @override
  List<Object> get props => [viewmodel];
}

class ActiveAccountUninitState extends ActiveAccountState {
  const ActiveAccountUninitState()
      : super(viewmodel: const ActiveAccountViewModel());
}

class ActiveAccountPrimaryState extends ActiveAccountState {
  const ActiveAccountPrimaryState(
      {ActiveAccountViewModel viewmodel = const ActiveAccountViewModel()})
      : super(viewmodel: viewmodel);
}

class ActiveAccountLoadingState extends ActiveAccountState   {
  final bool isRefresh;
  const ActiveAccountLoadingState(
      {ActiveAccountViewModel viewmodel = const ActiveAccountViewModel(),
      this.isRefresh = false})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [isRefresh, viewmodel];
}

class ActiveAccountErrorState extends ActiveAccountState {
  final BaseDigException exception;
  const ActiveAccountErrorState(
      {ActiveAccountViewModel viewmodel = const ActiveAccountViewModel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);
}
