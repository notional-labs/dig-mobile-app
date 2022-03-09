import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit {
  /// TODO: Impl [checkAuthencation]
  void checkAuthencation() {
    Future.delayed(const Duration(seconds: 2), () {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(DigPageName.home, (route) => false);
    });
  }
}
