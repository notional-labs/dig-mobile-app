import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:equatable/equatable.dart';

class TransferTokenViewmodel extends Equatable {
  final String senderAddress;
  final String recipient;
  final double tokenToSend;
  final double tokenAvailable;
  final double gas;
  final bool advance;

  const TransferTokenViewmodel({
    this.senderAddress = '',
    this.recipient = '',
    this.tokenToSend = 0,
    this.tokenAvailable = 0,
    this.gas = 0,
    this.advance = false,
  });

  bool get isTokenToSendValid =>
      tokenAvailable > 0 && (tokenToSend + gas) <= tokenAvailable;

  String get tokenToSendValidMessage {
    if (isTokenToSendValid) {
      return '';
    }

    return S.current.not_enough_token;
  }

  bool get isRecipientValid => recipient.isNotEmpty;

  bool get isAllValid => isTokenToSendValid && isRecipientValid;

  TransferTokenViewmodel copyWith({
    String? senderAddress,
    String? recipient,
    double? tokenToSend,
    double? tokenAvailable,
    double? gas,
    bool? advance,
  }) {
    return TransferTokenViewmodel(
      senderAddress: senderAddress ?? this.senderAddress,
      recipient: recipient ?? this.recipient,
      tokenToSend: tokenToSend ?? this.tokenToSend,
      tokenAvailable: tokenAvailable ?? this.tokenAvailable,
      gas: gas ?? this.gas,
      advance: advance ?? this.advance,
    );
  }

  @override
  List<Object> get props {
    return [
      senderAddress,
      recipient,
      tokenToSend,
      tokenAvailable,
      gas,
      advance,
    ];
  }
}
