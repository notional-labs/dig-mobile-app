import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/create_account_page_viewmodel.dart';

abstract class CreateAccountState extends Equatable {
  final CreateAccountPageViewmodel viewmodel;
  const CreateAccountState(
      {this.viewmodel = const CreateAccountPageViewmodel()});

  @override
  List<Object> get props => [viewmodel];
}

class CreateAccountUninitState extends CreateAccountState {
  const CreateAccountUninitState(
      {CreateAccountPageViewmodel viewmodel =
          const CreateAccountPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class CreateAccountLoadingState extends CreateAccountState {
  const CreateAccountLoadingState(
      {CreateAccountPageViewmodel viewmodel =
          const CreateAccountPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class CreateAccountPrimaryState extends CreateAccountState {
  const CreateAccountPrimaryState(
      {CreateAccountPageViewmodel viewmodel =
          const CreateAccountPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class CreateAccountChangedFormStateState extends CreateAccountState {
  const CreateAccountChangedFormStateState(
      {CreateAccountPageViewmodel viewmodel =
          const CreateAccountPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class CreateAccountSuccessState extends CreateAccountState {
  const CreateAccountSuccessState(
      {CreateAccountPageViewmodel viewmodel =
          const CreateAccountPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class CreateAccountErrorState extends CreateAccountState {
  final BaseDigException exception;
  const CreateAccountErrorState(
      {CreateAccountPageViewmodel viewmodel =
          const CreateAccountPageViewmodel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [viewmodel, exception];
}
