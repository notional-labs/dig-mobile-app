import 'package:dig_mobile_app/app/cubit/staking/staking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class StakingCubit extends Cubit<StakingState> {
  StakingCubit() : super(const StakingPrimaryState());

  /// TODO: Impl [fetchData]
  Future fetchData() async {}
}
