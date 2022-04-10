import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/app/viewmodel/active_account_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

part 'active_account_state.dart';

@Injectable()
class ActiveAccountCubit extends Cubit<ActiveAccountState> {
  ActiveAccountCubit() : super(const ActiveAccountUninitState());

  final RemoveAccountUseCase _removeAccountUseCase = di();
  final DeletePinUseCase _deletePinUseCase = di();
  final GetListBalanceUseCase _getListBalanceUseCase = di();

  Future fetchData(AccountPublicInfo account) async {
    emit(ActiveAccountLoadingState(viewmodel: state.viewmodel.copyWith()));
    final result = await _getListBalanceUseCase.call(GetListBalanceUseCaseParam(
        request: BalanceRequest(address: account.publicAddress)));
    result.fold((l) {
      emit(ActiveAccountErrorState(
          viewmodel: state.viewmodel.copyWith(), exception: l));
    }, (r) {
      emit(ActiveAccountPrimaryState(
          viewmodel: state.viewmodel.copyWith(balances: r)));
    });
  }

  void copyAddressToClipboard(String address) {
    Clipboard.setData(ClipboardData(text: address));
  }

  void onSelectTab(int index) {
    emit(ActiveAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(selectedTab: index)));
  }

  Future removeAccount(AccountPublicInfo accountPublicInfo) async {
    final result = await _removeAccountUseCase
        .call(RemoveAccountUseCaseParam(accountPublicInfo: accountPublicInfo));

    if (result.isRight()) {
      await _deletePinUseCase.call(const None());
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(DigPageName.signIn, (route) => false);
    }
  }
}
