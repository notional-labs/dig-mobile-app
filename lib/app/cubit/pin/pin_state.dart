import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/pin_viewmodel.dart';

abstract class PinState extends Equatable {
  final PinViewmodel viewmodel;
  const PinState({
    this.viewmodel = const PinViewmodel(),
  });

  @override
  List<Object> get props => [viewmodel];
}

class PinPrimaryState extends PinState {
  const PinPrimaryState({PinViewmodel viewmodel = const PinViewmodel()})
      : super(viewmodel: viewmodel);
}

class PinChangedState extends PinState {
  const PinChangedState({PinViewmodel viewmodel = const PinViewmodel()})
      : super(viewmodel: viewmodel);
}
