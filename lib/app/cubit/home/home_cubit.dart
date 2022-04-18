import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/home/home_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/home/home_drawer.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialSate());

  final GetSelectedAccountUseCase _getSelectedAccountUseCase = di();
  final GetListAccountUseCase _getListAccountUseCase = di();
  final SelectAccountUseCase _selectAccountUseCase = di();
  final RemoveAccountUseCase _removeAccountUseCase = di();
  final DeletePinUseCase _deletePinUseCase = di();

  Future init() async {
    AccountPublicInfo? account;
    List<AccountPublicInfo> accounts = const [];
    final getSelectedAccountUseCaseResult = await _getSelectedAccountUseCase
        .call(const GetSelectedAccountUseCaseParam());
    final getListAccountUseCaseResult =
        await _getListAccountUseCase.call(const GetListAccountUseCaseParam());

    if (getSelectedAccountUseCaseResult.isRight()) {
      getSelectedAccountUseCaseResult.foldRight(null, (r, _) {
        account = r;
      });
    }

    if (getListAccountUseCaseResult.isRight()) {
      getListAccountUseCaseResult.foldRight(const [], (r, _) {
        accounts = r;
      });
    }

    final viewModel =
        state.viewModel.copyWith(account: account, accounts: accounts);

    if (accounts.isNotEmpty && account != null) {
      emit(HomePrimaryState(viewModel: viewModel));
      return;
    }

    emit(HomeErrorState(
        viewModel: state.viewModel.copyWith(),
        exception: DigException(message: S.current.some_thing_wrong)));
  }

  Future changeAccount(AccountPublicInfo account) async {
    await _selectAccountUseCase
        .call(SelectAccountUseCaseParam(accountPublicInfo: account));
    emit(HomeChangedAccountState(
        viewModel: state.viewModel
            .copyWith(account: account, currentHomePage: DrawerMenu.account)));
    emit(HomePrimaryState(viewModel: state.viewModel.copyWith()));
  }

  void changeHomePage(DrawerMenu drawerMenu) {
    navigatorKey.currentState!.pop();
    if (drawerMenu == state.viewModel.currentDrawerMenu) {
      return;
    }
    emit(HomePrimaryState(
        viewModel: state.viewModel.copyWith(currentHomePage: drawerMenu)));
  }

  Future removeAccount(AccountPublicInfo accountPublicInfo) async {
    final result = await _removeAccountUseCase
        .call(RemoveAccountUseCaseParam(accountPublicInfo: accountPublicInfo));

    if (result.isRight()) {
      final getListAccountUseCaseResult =
          await _getListAccountUseCase.call(const GetListAccountUseCaseParam());

      if (getListAccountUseCaseResult.isRight()) {
        List<AccountPublicInfo> accounts = const [];
        getListAccountUseCaseResult.foldRight(const [], (r, _) {
          accounts = r;
        });
        await _selectAccountUseCase
            .call(SelectAccountUseCaseParam(accountPublicInfo: accounts.first));
        init();
        return;
      }

      await _deletePinUseCase.call(const None());
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(DigPageName.signIn, (route) => false);

      return;
    }

    emit(HomeErrorState(
        viewModel: state.viewModel.copyWith(),
        exception: DigException(message: S.current.some_thing_wrong)));
  }

  void goToSignInPage() =>
      navigatorKey.currentState?.pushNamed(DigPageName.signIn);
}
