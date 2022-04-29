import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/transfer_token_viewmodel.dart';
import 'package:equatable/equatable.dart';

abstract class TransferTokenState extends Equatable {
  final TransferTokenViewmodel viewmodel;
  const TransferTokenState({
    this.viewmodel = const TransferTokenViewmodel(),
  });

  @override
  List<Object> get props => [viewmodel];
}

class TransferTokenPrimaryState extends TransferTokenState {
  const TransferTokenPrimaryState(
      {TransferTokenViewmodel viewmodel = const TransferTokenViewmodel()})
      : super(viewmodel: viewmodel);
}

class TransferTokenSendingState extends TransferTokenState {
  const TransferTokenSendingState(
      {TransferTokenViewmodel viewmodel = const TransferTokenViewmodel()})
      : super(viewmodel: viewmodel);
}

class TransferTokenSuccessState extends TransferTokenState {
  const TransferTokenSuccessState(
      {TransferTokenViewmodel viewmodel = const TransferTokenViewmodel()})
      : super(viewmodel: viewmodel);
}

class TransferTokenChangedFormState extends TransferTokenState {
  const TransferTokenChangedFormState(
      {TransferTokenViewmodel viewmodel = const TransferTokenViewmodel()})
      : super(viewmodel: viewmodel);
}

class TransferTokenErrorState extends TransferTokenState {
  final BaseDigException exception;
  const TransferTokenErrorState(
      {TransferTokenViewmodel viewmodel = const TransferTokenViewmodel(),
      this.exception = const DigException()})
      : super(viewmodel: viewmodel);

  @override
  List<Object> get props => [exception, viewmodel];
}
