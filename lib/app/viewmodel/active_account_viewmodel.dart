import 'package:collection/collection.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:equatable/equatable.dart';

class ActiveAccountViewModel extends Equatable {
  final int selectedTab;
  final List<Balance> balances;
  const ActiveAccountViewModel(
      {this.selectedTab = 0, this.balances = const []});

  double getDigBalance() {
    final balance =
        balances.firstWhereOrNull((element) => Denom.udig == element.denom);
    return (double.tryParse(balance?.amount ?? '') ?? 0) /
        TokenBalanceRatio.ratio;
  }

  ActiveAccountViewModel copyWith({int? selectedTab, List<Balance>? balances}) {
    return ActiveAccountViewModel(
        selectedTab: selectedTab ?? this.selectedTab,
        balances: balances ?? this.balances);
  }

  @override
  List<Object> get props => [selectedTab, balances];
}
