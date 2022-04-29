import 'package:dig_mobile_app/app/cubit/active_account/transfer_token/transfer_token_state.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransferTokenCubit extends Cubit<TransferTokenState> {
  TransferTokenCubit() : super(const TransferTokenPrimaryState());

  void init({required String senderAddress, required double tokenAvailable}) {
    emit(TransferTokenPrimaryState(
        viewmodel: state.viewmodel.copyWith(
            tokenAvailable: tokenAvailable, senderAddress: senderAddress)));
  }

  /// TODO: Impl [transferToken]
  Future transferToken() async {}

  void changeAdvanceEvent(bool value) {
    emit(TransferTokenChangedFormState(
        viewmodel: state.viewmodel.copyWith(advance: value, gas: 0)));
    emit(TransferTokenPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeRecipientAddressEvent(String recipient) {
    emit(TransferTokenChangedFormState(
        viewmodel: state.viewmodel.copyWith(recipient: recipient)));
    emit(TransferTokenPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeTokenToSendEvent(double tokenToSend) {
    emit(TransferTokenChangedFormState(
        viewmodel: state.viewmodel.copyWith(tokenToSend: tokenToSend)));
    emit(TransferTokenPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeGasEvent(double gas) {
    emit(TransferTokenChangedFormState(
        viewmodel: state.viewmodel.copyWith(gas: gas)));
    emit(TransferTokenPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void closeEvent() => navigatorKey.currentState!.pop();
}
