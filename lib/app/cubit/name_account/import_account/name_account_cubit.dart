import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/name_account/import_account/name_account_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NameAccountCubit extends Cubit<NameAccountState> {
  NameAccountCubit() : super(const NameAccountUninitState());

  final ImportAccountUseCase _importAccountUseCase = di();
  final ChainENV _chain = di<ENV>().digChain;

  void init(String mnemonic) {
    emit(NameAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(mnemonic: mnemonic)));
  }

  Future changeNameAccountEvent(String name) async {
    emit(NameAccountChangedFormState(
        viewmodel: state.viewmodel.copyWith(name: name)));
    emit(NameAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  Future createvent() async {
    emit(NameAccountLoadingState(viewmodel: state.viewmodel.copyWith()));
    final result = await _importAccountUseCase.call(ImportAccountUseCaseParam(
        importAccount: ImportAccount(
            importAccountFormData: ImportAccountFormData(
                name: state.viewmodel.name,
                password: '',
                mnemonic: state.viewmodel.name,
                additionalData:
                    const AccountAdditionalData(isBackedUp: false))),
        chain: _chain));
    result.fold((l) {
      emit(NameAccountErrorState(
          exception: l, viewmodel: state.viewmodel.copyWith()));
    }, (r) {
      emit(NameAccountSuccessState(viewmodel: state.viewmodel.copyWith()));
    });
  }

  void goToHome() => navigatorKey.currentState!
      .pushNamedAndRemoveUntil(DigPageName.home, (route) => false);

  void backEnvent() => navigatorKey.currentState!.pop();

  /// TODO: Impl [tapAdvancedEvent]
  void tapAdvancedEvent() {}
}
