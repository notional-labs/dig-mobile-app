import 'package:dig_core/src/data/network/env.dart';
import 'package:dig_core/src/data/network/intercepter/dig_intecepter.dart';
import 'package:dig_core/src/di/di.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:transaction_signing_gateway/mobile/no_op_transaction_summary_ui.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

@injectableInit
void initDI(GetIt di, ENV env) {
  di
    ..registerLazySingleton<ENV>(() => env)
    ..registerLazySingleton<DigIntercepter>(() => DigIntercepter());

  final Dio dio = Dio()
    ..options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      sendTimeout: 30000,
    );
  dio.interceptors.add(di<DigIntercepter>());

  di.registerLazySingleton<Dio>(() => dio);

  $initGetIt(di);
}

