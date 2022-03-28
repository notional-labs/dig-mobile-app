import 'package:dig_mobile_app/app/definition/config.dart';
import 'package:equatable/equatable.dart';

class PinViewmodel extends Equatable {
  final String pin;
  const PinViewmodel({
    this.pin = '',
  });

  bool get isValid => pin.isNotEmpty && pin.length == PinConfig.length;

  PinViewmodel copyWith({
    String? pin,
  }) {
    return PinViewmodel(
      pin: pin ?? this.pin,
    );
  }

  @override
  List<Object> get props => [pin];
}
