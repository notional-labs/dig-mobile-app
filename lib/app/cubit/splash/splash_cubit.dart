import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/splash/splash_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final GetSelectedAccountUseCase _getAccountListUseCase = di();
  final ChainENV _chain = di<ENV>().digChain;

  SplashCubit() : super(const SplashUninitState());

  void checkAuthentication() {
    Future.delayed(const Duration(seconds: 2), () async {
      final result = await _getAccountListUseCase
          .call(GetSelectedAccountUseCaseParam(chain: _chain));
      result.fold((failure) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(DigPageName.signIn, (route) => false);
      }, (account) {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
            DigPageName.home, (route) => false,
            arguments: account);
      });
    });
  }
}
