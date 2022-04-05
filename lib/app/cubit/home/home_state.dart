import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/home_viewmodel.dart';

abstract class HomeState extends Equatable {
  final HomeViewmodel viewmodel;
  const HomeState({this.viewmodel = const HomeViewmodel()});

  @override
  List<Object> get props => [viewmodel];
}

class HomeUninitSate extends HomeState {
  const HomeUninitSate() : super(viewmodel: const HomeViewmodel());
}

class HomePrimaryState extends HomeState {
  const HomePrimaryState({HomeViewmodel viewmodel = const HomeViewmodel()})
      : super(viewmodel: viewmodel);
}

class HomeErrorState extends HomeState {
  final BaseDigException exception;
  const HomeErrorState(
      {HomeViewmodel viewmodel = const HomeViewmodel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [viewmodel, exception];
}
