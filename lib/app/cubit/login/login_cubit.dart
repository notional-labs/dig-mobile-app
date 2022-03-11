import 'package:dig_mobile_app/app/cubit/login/login_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginUninitState());

  /// TODO: Impl [loginNormalEvent]
  Future loginNormalEvent() async {
    if (!state.viewmodel.isFormValid) {
      return;
    }
    emit(LoginLoadingState(viewmodel: state.viewmodel.copyWith()));
    await Future.delayed(const Duration(seconds: 2));
    emit(LoginAuthenticatedState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeEmailEvent(String email) {
    emit(LoginPrimaryState(
        viewmodel: state.viewmodel
            .copyWith(email: email, password: state.viewmodel.password)));
    emit(LoginPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changePasswordEvent(String password) {
    emit(LoginPrimaryState(
        viewmodel: state.viewmodel
            .copyWith(email: state.viewmodel.email, password: password)));
    emit(LoginPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  /// TODO: Impl [forgotPasswordEvent]
  void forgotPasswordEvent() {}

  /// TODO: Impl [loginWithGoogleEvent]
  void loginWithGoogleEvent() {}

  /// TODO: Impl [loginWithTwitterEvent]
  void loginWithTwitterEvent() {}

  /// TODO: Impl [loginWithFacebookEvent]
  void loginWithFacebookEvent() {}

  /// TODO: Impl [loginWithAppleEvent]
  void loginWithAppleEvent() {}

  /// TODO: Impl [goToCreateAccountEvent]
  Future<dynamic> goToCreateAccountEvent() async {}

  Future<dynamic> goToHomeEvent() => navigatorKey.currentState!
      .pushNamedAndRemoveUntil(DigPageName.home, (route) => false);
}
