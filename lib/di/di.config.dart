// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dig_core/dig_core.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../app/cubit/active_account/active_account_cubit.dart' as _i3;
import '../app/cubit/app/app_cubit.dart' as _i4;
import '../app/cubit/backup_your_wallet/backup_your_wallet_cubit.dart' as _i5;
import '../app/cubit/confirm_pin/confirm_pin_cubit.dart' as _i7;
import '../app/cubit/confirm_recovery_phrase/confirm_recovery_phrase_cubit.dart'
    as _i8;
import '../app/cubit/import_account/import_account_cubit.dart' as _i9;
import '../app/cubit/name_account/import_account/name_account_cubit.dart'
    as _i10;
import '../app/cubit/pin/pin_cubit.dart' as _i11;
import '../app/cubit/recovery_phrase/recovery_phrase_cubit.dart' as _i12;
import '../app/cubit/sign_in/sign_in_cubit.dart' as _i13;
import '../app/cubit/splash/splash_cubit.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ActiveAccountCubit>(() => _i3.ActiveAccountCubit());
  gh.factory<_i4.AppCubit>(() => _i4.AppCubit());
  gh.factory<_i5.BackupYourWalletCubit>(
      () => _i5.BackupYourWalletCubit(get<_i6.CreateMnemonicUseCase>()));
  gh.factory<_i7.ConfirmPinCubit>(() => _i7.ConfirmPinCubit());
  gh.factory<_i8.ConfirmRecoveryPhraseCubit>(
      () => _i8.ConfirmRecoveryPhraseCubit());
  gh.factory<_i9.ImportAccountCubit>(() => _i9.ImportAccountCubit());
  gh.factory<_i10.NameAccountCubit>(() => _i10.NameAccountCubit());
  gh.factory<_i11.PinCubit>(() => _i11.PinCubit());
  gh.factory<_i12.RecoveryPhraseCubit>(() => _i12.RecoveryPhraseCubit());
  gh.factory<_i13.SignInCubit>(() => _i13.SignInCubit());
  gh.factory<_i14.SplashCubit>(() => _i14.SplashCubit());
  return get;
}
