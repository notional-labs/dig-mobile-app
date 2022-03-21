import 'package:dig_mobile_app/app/cubit/name_account/import_account/name_account_state.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NameAccountCubit extends Cubit<NameAccountState> {
  NameAccountCubit() : super(const NameAccountPrimaryState());

  void changeNameAccountEvent(String recoveryPhrase) {
    emit(NameAccountChangedFormState(
        viewmodel: state.viewmodel.copyWith(recoveryPhrase: recoveryPhrase)));
    emit(NameAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  /// TODO: Impl [createvent]
  Future createvent() async {
    emit(NameAccountLoadingState(viewmodel: state.viewmodel.copyWith()));
    await Future.delayed(const Duration(seconds: 2));
    emit(NameAccountSuccessState(viewmodel: state.viewmodel.copyWith()));
  }

  void backEnvent() => navigatorKey.currentState!.pop();

  /// TODO: Impl [tapAdvancedEvent]
  void tapAdvancedEvent() {}
}
