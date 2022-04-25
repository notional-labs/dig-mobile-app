import 'package:bloc/bloc.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/active_account_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

part 'active_account_state.dart';

@Injectable()
class ActiveAccountCubit extends Cubit<ActiveAccountState> {
  ActiveAccountCubit() : super(const ActiveAccountUninitState());
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

  void onShareAddress(String content) {
    if (content.trim().isEmpty) {
      return;
    }
    Share.share(content).catchError(_handleShareAddressFailure);
  }

  void _handleShareAddressFailure(exception) {
    emit(ActiveAccountErrorState(
        viewmodel: state.viewmodel.copyWith(),
        exception: DigException(message: exception)));
  }
}
