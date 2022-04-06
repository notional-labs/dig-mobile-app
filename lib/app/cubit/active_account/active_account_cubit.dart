import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/app/viewmodel/active_account_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:injectable/injectable.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

part 'active_account_state.dart';

@Injectable()
class ActiveAccountCubit extends Cubit<ActiveAccountState> {
  ActiveAccountCubit() : super(ActiveAccountInitial());

  final RemoveAccountUseCase _removeAccountUseCase = di();
  final DeletePinUseCase _deletePinUseCase = di();

  void onSelectTab(int index) {
    emit(ActiveAccountPrimaryState(
        model: state.model.copyWith(selectedTab: index)));
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
