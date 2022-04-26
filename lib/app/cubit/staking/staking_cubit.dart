import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/staking/staking_state.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_item_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';

const List<String> _priorityValidatorAddresses = [
  'digvaloper12hjc5e9z3c4x8hl8yyxlqfx67wr89meaas6k7z',
  'digvaloper1cxu3telmqz2we6s8xy4xckr8sl2n7judqdq629',
  'digvaloper1lu3at7mda24anr9eecdhyt9wsq8dwhrn664y4z'
];

@injectable
class StakingCubit extends Cubit<StakingState> {
  final GetValidatorUseCase _getValidatorUseCase;
  StakingCubit(this._getValidatorUseCase) : super(const StakingPrimaryState());

  Future fetchData() async {
    emit(StakingLoadingState(viewmodel: state.viewmodel.copyWith()));
    final result =
        await _getValidatorUseCase.call(const GetValidatorUseCaseParam());

    result.fold((l) {
      emit(StakingErrorState(
          viewmodel: state.viewmodel.copyWith(), exception: l));
    }, (r) {
      final ValidatorResponse validatorResponse = r.copyWith();

      /// Get priority items
      final bogo1 = validatorResponse.result.firstWhereOrNull((element) =>
          element.operatorAddress == _priorityValidatorAddresses[0]);
      final bogo2 = validatorResponse.result.firstWhereOrNull((element) =>
          element.operatorAddress == _priorityValidatorAddresses[1]);
      final bogo3 = validatorResponse.result.firstWhereOrNull((element) =>
          element.operatorAddress == _priorityValidatorAddresses[2]);

      /// Create [listBogo] without `null` item
      final List<Result> listBogo = [bogo2, bogo3, bogo1]
          .where((element) => element != null)
          .toList()
          .cast();

      /// Remove exits bogo
      validatorResponse.result.removeWhere((element) =>
          _priorityValidatorAddresses.contains(element.operatorAddress));

      /// Insert [listBogo] at first
      validatorResponse.result.insertAll(0, listBogo);

      final totalSupply = validatorResponse.result.fold(
          0,
          (num previousValue, element) =>
              previousValue + (double.tryParse(element.delegatorShares) ?? 0));

      final List<String> url = validatorResponse.result
          .map((element) => element.description.identity)
          .toList();

      final List<StakingItemViewModel> stakingItemViewModel =
          validatorResponse.result.map((element) {
        /// Compute commsion
        final commsion =
            (double.tryParse(element.commission.commissionRates.rate) ?? 0) *
                100;

        /// Compute power
        double power = 0;
        if (totalSupply != 0) {
          power = ((double.tryParse(element.delegatorShares) ?? 0) * 100) /
              totalSupply;
        }
        return StakingItemViewModel(
          identity: element.description.identity,
          name: element.description.moniker,
          website: element.description.website,
          token: element.tokens,
          power: power,
          commsion: commsion,
        );
      }).toList();
      emit(StakingPrimaryState(
          viewmodel: state.viewmodel.copyWith(items: stakingItemViewModel)));
    });
  }
}
