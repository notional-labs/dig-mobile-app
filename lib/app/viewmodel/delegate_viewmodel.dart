import 'package:equatable/equatable.dart';

import 'package:dig_mobile_app/app/viewmodel/delegate_validator_item_viewmodel.dart';
import 'package:dig_mobile_app/generated/l10n.dart';

class DelegateViewModel extends Equatable {
  final String delegatorAddress;
  final DelegateValidatorItemViewmodel validator;
  final num tokenToStake;
  final num tokenAvailable;
  final num gas;
  final bool advance;
  final List<DelegateValidatorItemViewmodel> validators;

  const DelegateViewModel({
    this.delegatorAddress = '',
    this.validator = const DelegateValidatorItemViewmodel(),
    this.tokenToStake = 0,
    this.tokenAvailable = 0,
    this.gas = 0,
    this.advance = false,
    this.validators = const [],
  });

  bool get istokenToStakeValid =>
      tokenAvailable > 0 && (tokenToStake + gas) <= tokenAvailable;

  String get tokenToStakeValidMessage {
    if (istokenToStakeValid) {
      return '';
    }

    return S.current.not_enough_token;
  }

  bool get isValidatorAddressValid => validator.address.isNotEmpty;

  bool get isAllValid => istokenToStakeValid && isValidatorAddressValid;

  DelegateViewModel copyWith({
    String? delegatorAddress,
    DelegateValidatorItemViewmodel? validator,
    num? tokenToStake,
    num? tokenAvailable,
    num? gas,
    bool? advance,
    List<DelegateValidatorItemViewmodel>? validators,
  }) {
    return DelegateViewModel(
      delegatorAddress: delegatorAddress ?? this.delegatorAddress,
      validator: validator ?? this.validator,
      tokenToStake: tokenToStake ?? this.tokenToStake,
      tokenAvailable: tokenAvailable ?? this.tokenAvailable,
      gas: gas ?? this.gas,
      advance: advance ?? this.advance,
      validators: validators ?? this.validators,
    );
  }

  @override
  List<Object> get props {
    return [
      delegatorAddress,
      validator,
      tokenToStake,
      tokenAvailable,
      gas,
      advance,
      validators,
    ];
  }
}
