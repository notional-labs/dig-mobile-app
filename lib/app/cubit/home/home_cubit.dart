import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/home/home_state.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/app/viewmodel/home_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialSate());

  final GetSelectedAccountUseCase _getSelectedAccountUseCase = di();
  final GetListAccountUseCase _getListAccountUseCase = di();

  Future init() async {
    AccountPublicInfo? account;
    List<AccountPublicInfo> accounts = const [];
    final getSelectedAccountUseCaseResult = await _getSelectedAccountUseCase
        .call(const GetSelectedAccountUseCaseParam());
    final getListAccountUseCaseResult =
        await _getListAccountUseCase.call(const GetListAccountUseCaseParam());

    if (getListAccountUseCaseResult.isRight()) {
      getSelectedAccountUseCaseResult.foldRight(null, (r, _) {
        account = r;
      });
    }

    if (getListAccountUseCaseResult.isRight()) {
      getListAccountUseCaseResult.foldRight(const [], (r, _) {
        accounts = r;
      });
    }

    final viewModel = state.viewModel.copyWith(account: account);

    if (accounts.isNotEmpty && account != null) {
      emit(HomePrimaryState(viewModel: viewModel));
      return;
    }

    emit(HomeErrorState(
        viewModel: state.viewModel.copyWith(),
        exception: DigException(message: S.current.some_thing_wrong)));
  }

  void changeHomePage(CurrentHomePage currentHomePage) {
    navigatorKey.currentState!.pop();
    if (currentHomePage == state.viewModel.currentHomePage) {
      return;
    }
    emit(HomePrimaryState(
        viewModel: state.viewModel.copyWith(currentHomePage: currentHomePage)));
  }
}
