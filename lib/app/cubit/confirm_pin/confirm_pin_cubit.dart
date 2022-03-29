import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/confirm_pin/confirm_pin_state.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConfirmPinCubit extends Cubit<ConfirmPinState> {
  ConfirmPinCubit() : super(const ConfirmPinPrimaryState());

  void init(String pin) {
    emit(ConfirmPinPrimaryState(viewmodel: state.viewmodel.copyWith(pin: pin)));
  }

  void changeConfirmPinEvent(String confirmPin) {
    emit(ConfirmPinChangedState(
        viewmodel: state.viewmodel.copyWith(confirmPin: confirmPin)));
    emit(ConfirmPinPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  bool continueEvent() {
    if (state.viewmodel.isValid) {
      emit(ConfirmPinSuccessState(viewmodel: state.viewmodel.copyWith()));
      return false;
    }

    emit(ConfirmPinErrorState(
        viewmodel: state.viewmodel.copyWith(),
        exception: DigException(message: S.current.passcode_do_not_match)));
    return true;
  }

  void backEvent() => navigatorKey.currentState!.pop();
}
