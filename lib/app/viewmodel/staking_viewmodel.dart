import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/staking_item_viewmodel.dart';

class StakingViewmodel extends Equatable {
  final List<StakingItemViewModel> items;
  const StakingViewmodel({this.items = const []});

  StakingViewmodel copyWith({
    List<StakingItemViewModel>? items,
  }) {
    return StakingViewmodel(
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [items];
}
