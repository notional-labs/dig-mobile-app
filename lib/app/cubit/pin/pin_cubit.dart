import 'package:dig_mobile_app/app/cubit/pin/pin_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/confirm_pin/confirm_pin_page.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PinCubit extends Cubit<PinState> {
  PinCubit() : super(const PinPrimaryState());

  void changePinEvent(String pin) {
    emit(PinChangedState(viewmodel: state.viewmodel.copyWith(pin: pin)));
    emit(PinPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void continueEvent()  => navigatorKey.currentState!.pushNamed(DigPageName.confirmPin,
          arguments: ConfirmPinPageParam(pin: state.viewmodel.pin));

  void backEvent() => navigatorKey.currentState!.pop();
}
