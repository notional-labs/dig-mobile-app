import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/delegate_validator_item_viewmodel.dart';
import 'package:dig_mobile_app/app/viewmodel/staking_item_viewmodel.dart';

class StakingViewmodel extends Equatable {
  final AccountPublicInfo? account;
  final num balance;
  final List<StakingItemViewModel> stakingItems;
  final List<DelegateValidatorItemViewmodel> validatorItems;
  const StakingViewmodel({
    this.account,
    this.balance = 0,
    this.stakingItems = const [],
    this.validatorItems = const [],
  });

  AccountPublicInfo get getAccount => account!;

  StakingViewmodel copyWith({
    AccountPublicInfo? account,
    num? balance,
    List<StakingItemViewModel>? stakingItems,
    List<DelegateValidatorItemViewmodel>? validatorItems,
  }) {
    return StakingViewmodel(
      account: account ?? this.account,
      balance: balance ?? this.balance,
      stakingItems: stakingItems ?? this.stakingItems,
      validatorItems: validatorItems ?? this.validatorItems,
    );
  }

  @override
  List<Object?> get props => [account, balance, stakingItems, validatorItems];
}
