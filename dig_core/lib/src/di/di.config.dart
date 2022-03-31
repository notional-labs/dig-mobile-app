// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasource/local/create_db_datasource.dart' as _i5;
import '../data/datasource/local/pin_local_datasource.dart' as _i7;
import '../data/repository/auth_repository_impl.dart' as _i10;
import '../domain/repository/auth_repository.dart' as _i9;
import '../domain/usecase/auth/change_pin_usecase.dart' as _i11;
import '../domain/usecase/auth/check_has_pin_usecase.dart' as _i12;
import '../domain/usecase/auth/check_mnemonic_valid_usecase.dart' as _i4;
import '../domain/usecase/auth/create_mnemonic_usecase.dart' as _i13;
import '../domain/usecase/auth/create_pin_usecase.dart' as _i14;
import '../domain/usecase/auth/delete_pin_usecase.dart' as _i15;
import '../domain/usecase/auth/get_selected_account_usecase.dart' as _i16;
import '../domain/usecase/auth/import_account_usecase.dart' as _i17;
import '../domain/usecase/auth/match_pin_usecase.dart' as _i18;
import '../domain/usecase/check_fist_time_run_app_usecase.dart' as _i3;
import '../domain/util/util.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CheckFirstTimeRunAppUseCase>(
      () => _i3.CheckFirstTimeRunAppUseCase());
  gh.factory<_i4.CheckMnemonicValidUseCase>(
      () => _i4.CheckMnemonicValidUseCase());
  gh.factory<_i5.CreateDBDatasource>(() => _i5.CreateDBDatasourceImpl());
  gh.factory<_i6.CryptoUtils>(() => _i6.CryptoUtils());
  gh.factory<_i7.PinLocalDatasource>(() => _i7.PinLocalDatasourceImplement(
      get<_i8.FlutterSecureStorage>(), get<_i6.CryptoUtils>()));
  gh.factory<_i9.AuthRepository>(
      () => _i10.AuthRepositoryImplement(get<_i7.PinLocalDatasource>()));
  gh.factory<_i11.ChangePinUseCase>(
      () => _i11.ChangePinUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i12.CheckHasPinUseCase>(
      () => _i12.CheckHasPinUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i13.CreateMnemonicUseCase>(
      () => _i13.CreateMnemonicUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i14.CreatePinUseCase>(
      () => _i14.CreatePinUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i15.DeletePinUseCase>(
      () => _i15.DeletePinUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i16.GetSelectedAccountUseCase>(
      () => _i16.GetSelectedAccountUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i17.ImportAccountUseCase>(
      () => _i17.ImportAccountUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i18.MatchPinUseCase>(
      () => _i18.MatchPinUseCase(get<_i9.AuthRepository>()));
  return get;
}
