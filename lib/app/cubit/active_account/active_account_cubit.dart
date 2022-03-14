import 'package:bloc/bloc.dart';
import 'package:dig_mobile_app/app/viewmodel/active_account_viewmodel.dart';
import 'package:injectable/injectable.dart';

part 'active_account_state.dart';

@Injectable()
class ActiveAccountCubit extends Cubit<ActiveAccountState> {
  ActiveAccountCubit() : super(ActiveAccountInitial());

  void onSelectTab(int index) {
    emit(ActiveAccountPrimaryState(
        model: state.model.copyWith(selectedTab: index)));
  }
}
