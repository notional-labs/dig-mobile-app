// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/cubit/active_account/active_account_cubit.dart' as _i3;
import '../app/cubit/import_account/import_account_cubit.dart' as _i4;
import '../app/cubit/sign_in/sign_in_cubit.dart' as _i5;
import '../app/cubit/splash/splash_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ActiveAccountCubit>(() => _i3.ActiveAccountCubit());
  gh.factory<_i4.ImportAccountCubit>(() => _i4.ImportAccountCubit());
  gh.factory<_i5.SignInCubit>(() => _i5.SignInCubit());
  gh.factory<_i6.SplashCubit>(() => _i6.SplashCubit());
  return get;
}
