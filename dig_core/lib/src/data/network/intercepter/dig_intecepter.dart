import 'package:dig_core/src/data/exception/dig_exception_impl.dart';
import 'package:dig_core/src/domain/definition/string.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dio/dio.dart';
import 'package:dig_core/src/domain/extension/extension.dart';
import 'package:logger/logger.dart';

class DigIntercepter extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// TODO: Attach token here
    options.headers['Authorization'] = 'Token';
    options.headers['contentType'] = 'application/json';

    /// Log CURL
    Logger().i('CURL:\n ${options.toCURL()}');

    handler.next(options);
  }

  /// Trigger when [statusCode] = 200
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    /// Response data is not json, throw [BeanstalServerException]
    if (response.data is! Map) {
      /// Throw [BeanstalServerException] and catch it in [onError]
      return handler.reject(DioError(
          requestOptions: response.requestOptions,
          error: const DigServerException()));
    }

    handler.next(
        Response(requestOptions: response.requestOptions, data: response.data));
  }

  /// Trigger when [statusCode] != 200 or throw an [Exception]
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.error is BaseDigException) {
      return handler
          .reject(DioError(requestOptions: err.requestOptions, error: err));
    }

    /// Not receive response from server, throw [BeanstalNetworkException]
    if (err.type != DioErrorType.response) {
      return handler.reject(DioError(
          requestOptions: err.requestOptions,
          error: const DigNetworkException()));
    }

    /// Continue with a response
    ///TODO: Impl [message]
    const message = '';
    final statusCode = err.response!.statusCode!;

    /// TODO: Impl expired token
    if (statusCode == HttpCode.expiredToken) {
      return handler.reject(DioError(
          requestOptions: err.requestOptions,
          error: const DigNetworkException()));
    }

    handler.reject(DioError(
        requestOptions: err.requestOptions,
        error: DigServerException(message: message, code: statusCode)));
  }
}
