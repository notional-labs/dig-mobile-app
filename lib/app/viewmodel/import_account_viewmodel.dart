import 'package:equatable/equatable.dart';

class ImportAccountViewmodel extends Equatable {
  final String recoveryPhrase;

  const ImportAccountViewmodel({this.recoveryPhrase = ''});

  bool get isValid => recoveryPhrase.isNotEmpty;

  ImportAccountViewmodel copyWith({
    String? recoveryPhrase,
  }) {
    return ImportAccountViewmodel(
      recoveryPhrase: recoveryPhrase ?? this.recoveryPhrase,
    );
  }

  @override
  List<Object> get props => [recoveryPhrase];
}
