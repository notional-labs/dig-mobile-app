// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../dig_core.dart' as _i18;
import '../data/datasource/local/account_local_datasource.dart' as _i3;
import '../data/datasource/local/create_db_datasource.dart' as _i6;
import '../data/datasource/local/pin_local_datasource.dart' as _i8;
import '../data/network/env.dart' as _i21;
import '../data/repository/auth_repository_impl.dart' as _i11;
import '../domain/repository/auth_repository.dart' as _i10;
import '../domain/usecase/account/get_list_account_usecase.dart' as _i17;
import '../domain/usecase/account/get_selected_account_usecase.dart' as _i19;
import '../domain/usecase/account/select_account_usecase.dart' as _i24;
import '../domain/usecase/auth/change_pin_usecase.dart' as _i12;
import '../domain/usecase/auth/check_has_pin_usecase.dart' as _i13;
import '../domain/usecase/auth/check_mnemonic_valid_usecase.dart' as _i5;
import '../domain/usecase/auth/create_mnemonic_usecase.dart' as _i14;
import '../domain/usecase/auth/create_pin_usecase.dart' as _i15;
import '../domain/usecase/auth/delete_pin_usecase.dart' as _i16;
import '../domain/usecase/auth/import_account_usecase.dart' as _i20;
import '../domain/usecase/auth/match_pin_usecase.dart' as _i22;
import '../domain/usecase/auth/remove_account_usecase.dart' as _i23;
import '../domain/usecase/check_fist_time_run_app_usecase.dart' as _i4;
import '../domain/util/util.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountLocalDatasource>(
      () => _i3.AccountLocalDatasourceImplement());
  gh.factory<_i4.CheckFirstTimeRunAppUseCase>(
      () => _i4.CheckFirstTimeRunAppUseCase());
  gh.factory<_i5.CheckMnemonicValidUseCase>(
      () => _i5.CheckMnemonicValidUseCase());
  gh.factory<_i6.CreateDBDatasource>(() => _i6.CreateDBDatasourceImpl());
  gh.factory<_i7.CryptoUtils>(() => _i7.CryptoUtils());
  gh.factory<_i8.PinLocalDatasource>(() => _i8.PinLocalDatasourceImplement(
      get<_i9.FlutterSecureStorage>(), get<_i7.CryptoUtils>()));
  gh.factory<_i10.AuthRepository>(() => _i11.AuthRepositoryImplement(
      get<_i8.PinLocalDatasource>(), get<_i3.AccountLocalDatasource>()));
  gh.factory<_i12.ChangePinUseCase>(
      () => _i12.ChangePinUseCase(get<_i10.AuthRepository>()));
  gh.factory<_i13.CheckHasPinUseCase>(
      () => _i13.CheckHasPinUseCase(get<_i10.AuthRepository>()));
  gh.factory<_i14.CreateMnemonicUseCase>(
      () => _i14.CreateMnemonicUseCase(get<_i10.AuthRepository>()));
  gh.factory<_i15.CreatePinUseCase>(
      () => _i15.CreatePinUseCase(get<_i10.AuthRepository>()));
  gh.factory<_i16.DeletePinUseCase>(
      () => _i16.DeletePinUseCase(get<_i10.AuthRepository>()));
  gh.factory<_i17.GetListAccountUseCase>(() =>
      _i17.GetListAccountUseCase(get<_i10.AuthRepository>(), get<_i18.ENV>()));
  gh.factory<_i19.GetSelectedAccountUseCase>(() =>
      _i19.GetSelectedAccountUseCase(
          get<_i10.AuthRepository>(), get<_i18.ENV>()));
  gh.factory<_i20.ImportAccountUseCase>(() =>
      _i20.ImportAccountUseCase(get<_i10.AuthRepository>(), get<_i21.ENV>()));
  gh.factory<_i22.MatchPinUseCase>(
      () => _i22.MatchPinUseCase(get<_i10.AuthRepository>()));
  gh.factory<_i23.RemoveAccountUseCase>(() =>
      _i23.RemoveAccountUseCase(get<_i10.AuthRepository>(), get<_i21.ENV>()));
  gh.factory<_i24.SelectAccountUseCase>(
      () => _i24.SelectAccountUseCase(get<_i10.AuthRepository>()));
  return get;
}
