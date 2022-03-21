import 'package:equatable/equatable.dart';

class NameAccountViewmodel extends Equatable {
  final String recoveryPhrase;

  const NameAccountViewmodel({this.recoveryPhrase = ''});

  bool get isValid => recoveryPhrase.isNotEmpty;

  NameAccountViewmodel copyWith({
    String? recoveryPhrase,
  }) {
    return NameAccountViewmodel(
      recoveryPhrase: recoveryPhrase ?? this.recoveryPhrase,
    );
  }

  @override
  List<Object> get props => [recoveryPhrase];
}
