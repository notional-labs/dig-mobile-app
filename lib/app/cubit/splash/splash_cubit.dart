import 'package:dig_mobile_app/app/cubit/splash/splash_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashUninitState());

  /// TODO: Impl [checkAuthencation]
  void checkAuthencation() {
    Future.delayed(const Duration(seconds: 2), () {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(DigPageName.home, (route) => false);
    });
  }
}
