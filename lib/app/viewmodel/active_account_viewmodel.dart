import 'package:equatable/equatable.dart';

class ActiveAccountViewModel with EquatableMixin {
  final int selectedTab;

  ActiveAccountViewModel({this.selectedTab = 0});

  ActiveAccountViewModel copyWith({int? selectedTab}) =>
      ActiveAccountViewModel(selectedTab: selectedTab ?? this.selectedTab);

  @override
  List<Object?> get props => [selectedTab];
}
