import 'package:dig_mobile_app/app/cubit/pin/pin_state.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PinCubit extends Cubit<PinState> {
  PinCubit() : super(const PinPrimaryState());

  void changePinEvent(String pin) {
    emit(PinChangedState(viewmodel: state.viewmodel.copyWith(pin: pin)));
    emit(PinChangedState(viewmodel: state.viewmodel.copyWith()));
  }

  /// TODO: Impl [continueEvent]
  void continueEvent() {}

  void backEvent() => navigatorKey.currentState!.pop();
}
