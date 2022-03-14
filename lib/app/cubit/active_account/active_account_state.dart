part of 'active_account_cubit.dart';

abstract class ActiveAccountState {
  final ActiveAccountViewModel model;

  ActiveAccountState({required this.model});
}

class ActiveAccountInitial extends ActiveAccountState {
  ActiveAccountInitial() : super(model: ActiveAccountViewModel());
}

class ActiveAccountPrimaryState extends ActiveAccountState {
  ActiveAccountPrimaryState({required ActiveAccountViewModel model})
      : super(model: model);
}
