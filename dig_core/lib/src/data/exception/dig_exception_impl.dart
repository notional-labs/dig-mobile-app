import 'package:dig_core/src/domain/exception/dig_exception.dart';

class DigServerException extends BaseDigException {
  final int code;
  const DigServerException({this.code = -1, String message = ''})
      : super(message: message);

  BaseDigException copyWith({
    int? code,
    String? message,
  }) {
    return DigServerException(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [code, message];

  @override
  bool? get stringify => true;
}

class BeanstalkNetworkException extends BaseDigException {
  const BeanstalkNetworkException({String message = ''})
      : super(message: message);

  @override
  List<Object?> get props => const [];

  @override
  bool? get stringify => true;
}

class BeanstalkException extends BaseDigException {
  final StackTrace? trace;
  const BeanstalkException({String message = '', this.trace})
      : super(message: message);

  @override
  List<Object?> get props => [message, trace];

  @override
  bool? get stringify => true;
}
