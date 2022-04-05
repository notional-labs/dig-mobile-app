import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/app/app_state.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppPrimaryState());
  final GetSelectedAccountUseCase _getSelectedAccountUseCase = di();
  final CheckHasPinUseCase _checkHasPinUseCase = di();

  Future<bool> shouldEnterPIN() async {
    AccountPublicInfo? account;
    bool hasPin = false;
    final getSelectedAccountUseCaseResult = await _getSelectedAccountUseCase
        .call(const GetSelectedAccountUseCaseParam());

    getSelectedAccountUseCaseResult.fold((l) {}, (r) {
      account = r;
    });

    final checkHasPinUseCaseResult =
        await _checkHasPinUseCase.call(const None());
    hasPin = checkHasPinUseCaseResult.getOrElse(() => false);

    return account != null && hasPin;
  }
}
