import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/splash/splash_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/pin/pin_page.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final GetSelectedAccountUseCase _getAccountListUseCase = di();
  final ChainENV _chain = di<ENV>().digChain;
  final CheckHasPinUseCase _checkHasPinUseCase = di();
  final CheckFirstTimeRunAppUseCase _checkFirstRunUseCase = di();
  final DeletePinUseCase _deletePinUseCase = di();

  SplashCubit() : super(const SplashUninitState());

  Future checkAuthentication() async {
    Future.delayed(const Duration(seconds: 2), () async {
      await cleanOldData();
      final result = await _getAccountListUseCase
          .call(GetSelectedAccountUseCaseParam(chain: _chain));
      result.fold((failure) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(DigPageName.signIn, (route) => false);
      }, (account) {
        enterOrCreatePinEvent(account);
      });
    });
  }

  /// PIN save in KeyChain on IOS.
  /// Data in KeyChain alway remain after uninstalled app.
  /// So need to clearn data at first time open app.
  Future cleanOldData() async {
    final result = await _checkFirstRunUseCase.call(const None());
    bool isFirtCall = result.getOrElse(() => false);
    if (isFirtCall) {
      await _deletePinUseCase.call(const None());
    }
  }

  Future enterOrCreatePinEvent(account) async {
    final result = await _checkHasPinUseCase.call(const None());
    final exist = result.getOrElse(() => false);

    if (!exist) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          DigPageName.pin, (route) => false,
          arguments: PinPageType.create);
      return;
    }
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
        DigPageName.pin, (route) => false,
        arguments: PinPageType.authWhenLauchApp);
  }
}
