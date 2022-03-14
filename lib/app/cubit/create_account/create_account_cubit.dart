import 'package:dig_mobile_app/app/cubit/create_account/create_account_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(const CreateAccountUninitState());

  /// TODO: Impl [createAccountEvent]
  Future createAccountEvent() async {
    if (!state.viewmodel.isFormValid) {
      return;
    }
    emit(CreateAccountLoadingState(viewmodel: state.viewmodel.copyWith()));
    await Future.delayed(const Duration(seconds: 2));
    emit(CreateAccountSuccessState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeFirstnameEvent(String firstname) {
    emit(CreateAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(firstname: firstname)));
    emit(CreateAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeLastnameEvent(String lastname) {
    emit(CreateAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(lastname: lastname)));
    emit(CreateAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeEmailEvent(String email) {
    emit(CreateAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(email: email)));
    emit(CreateAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changePasswordEvent(String password) {
    emit(CreateAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(password: password)));
    emit(CreateAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeAcceptTermEvent(bool acceptTerm) {
    emit(CreateAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(acceptTerm: acceptTerm)));
    emit(CreateAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void backEvent() => navigatorKey.currentState!.pop();

  Future<dynamic> goToHomeEvent() => navigatorKey.currentState!
      .pushNamedAndRemoveUntil(DigPageName.home, (route) => false);
}
