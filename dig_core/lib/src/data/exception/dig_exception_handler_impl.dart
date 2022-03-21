import 'package:dig_core/src/data/exception/dig_exception_impl.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:transaction_signing_gateway/model/account_derivation_failure.dart';

class DigExceptionHandler implements BaseDigExceptionHandler {
  @override
  BaseDigException handler(any) {
    if (any is DioError) {
      return _handleDioError(any);
    }

    if (any is FirebaseAuthException) {
      return _handleFirebaseAuthError(any);
    }

    if (any is AccountDerivationFailure) {
      return _handleAccountDerivationFailure(any);
    }

    if (any is BaseDigException) {
      return any;
    }

    return DigException(message: any.toString());
  }

  BaseDigException _handleDioError(DioError any) {
    if (any.error is BaseDigException) {
      return any.error;
    }

    return const DigNetworkException();
  }

  BaseDigException _handleFirebaseAuthError(FirebaseAuthException any) {
    return DigServerException(message: any.message ?? '');
  }

  BaseDigException _handleAccountDerivationFailure(
      AccountDerivationFailure any) {
    switch (any.type) {
      case AccountDerivationFailType.invalidMnemonic:
        return const DigException(message: 'Invalid Mnemonic');
      case AccountDerivationFailType.derivatorNotFound:
        return const DigException(message: 'Derivator Not Found');
      default:
        return const DigException(message: 'Unknow Error');
    }
  }
}
