import 'package:dig_core/src/data/exception/dig_exception_impl.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DigExceptionHandler implements BaseDigExceptionHandler {
  @override
  BaseDigException handler(any) {
    if (any is DioError) {
      return _handleDioError(any);
    }

    if (any is FirebaseAuthException) {
      return _handleFirebaseAuthError(any);
    }

    if (any is BaseDigException) {
      return any;
    }

    return BeanstalkException(message: any.toString());
  }

  BaseDigException _handleDioError(DioError any) {
    if (any.error is BaseDigException) {
      return any.error;
    }

    return const BeanstalkNetworkException();
  }

  BaseDigException _handleFirebaseAuthError(FirebaseAuthException any) {
    return DigServerException(message: any.message ?? '');
  }
}
