import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance.g.dart';

@JsonSerializable()
class Balance extends Equatable {
  final String? denom;
  final String? amount;
  const Balance({
    this.denom,
    this.amount,
  });

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BlanceFromJson(json);

  Map<String, dynamic> toJson() => _$BlanceToJson(this);

  Balance copyWith({
    String? denom,
    String? amount,
  }) {
    return Balance(
      denom: denom ?? this.denom,
      amount: amount ?? this.amount,
    );
  }

  @override
  List<Object?> get props => [denom, amount];
}
