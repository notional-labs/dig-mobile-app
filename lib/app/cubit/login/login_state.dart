import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/login_page_viewmodel.dart';

abstract class LoginState extends Equatable {
  final LoginPageViewmodel viewmodel;
  const LoginState({this.viewmodel = const LoginPageViewmodel()});

  @override
  List<Object> get props => [viewmodel];
}

class LoginUninitState extends LoginState {
  const LoginUninitState(
      {LoginPageViewmodel viewmodel = const LoginPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState(
      {LoginPageViewmodel viewmodel = const LoginPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class LoginPrimaryState extends LoginState {
  const LoginPrimaryState(
      {LoginPageViewmodel viewmodel = const LoginPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class LoginChangedFormStateState extends LoginState {
  const LoginChangedFormStateState(
      {LoginPageViewmodel viewmodel = const LoginPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class LoginAuthenticatedState extends LoginState {
  const LoginAuthenticatedState(
      {LoginPageViewmodel viewmodel = const LoginPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class LoginUnauthenticatedState extends LoginState {
  const LoginUnauthenticatedState(
      {LoginPageViewmodel viewmodel = const LoginPageViewmodel()})
      : super(viewmodel: viewmodel);
}

class LoginErrorState extends LoginState {
  final BaseDigException exception;
  const LoginErrorState(
      {LoginPageViewmodel viewmodel = const LoginPageViewmodel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [viewmodel, exception];
}
