import 'package:dig_mobile_app/app/cubit/import_account/import_account_state.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ImportAccountCubit extends Cubit<ImportAccountState> {
  ImportAccountCubit() : super(const ImportAccountPrimaryState());

  void changeRecoveryPhraseEvent(String recoveryPhrase) {
    emit(ImportAccountChangedFormState(
        viewmodel: state.viewmodel.copyWith(recoveryPhrase: recoveryPhrase)));
    emit(ImportAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  /// TODO: Impl [importEvent]
  Future importEvent() async {
    emit(ImportAccountLoadingState(viewmodel: state.viewmodel.copyWith()));
    await Future.delayed(const Duration(seconds: 2));
    emit(ImportAccountSuccessState(viewmodel: state.viewmodel.copyWith()));
  }

  void backEnvent() => navigatorKey.currentState!.pop();

  /// TODO: Impl [tapAdvancedEvent]
  void tapAdvancedEvent() {}
}
