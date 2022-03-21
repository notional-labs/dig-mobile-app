import 'package:equatable/equatable.dart';

class NameAccountViewmodel extends Equatable {
  final String name;

  const NameAccountViewmodel({this.name = ''});

  bool get isValid => name.isNotEmpty;

  NameAccountViewmodel copyWith({
    String? name,
  }) {
    return NameAccountViewmodel(
      name: name ?? this.name,
    );
  }

  @override
  List<Object> get props => [name];
}
