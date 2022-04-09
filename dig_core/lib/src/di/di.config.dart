// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasource/local/account_local_datasource.dart' as _i3;
import '../data/datasource/local/create_db_datasource.dart' as _i9;
import '../data/datasource/local/pin_local_datasource.dart' as _i11;
import '../data/datasource/remote/account_remote_datasource.dart' as _i4;
import '../data/repository/account_repository_impl.dart' as _i6;
import '../data/repository/auth_repository_impl.dart' as _i14;
import '../domain/env/env.dart' as _i21;
import '../domain/repository/account_repository.dart' as _i5;
import '../domain/repository/auth_repository.dart' as _i13;
import '../domain/usecase/account/get_list_account_usecase.dart' as _i20;
import '../domain/usecase/account/get_selected_account_usecase.dart' as _i22;
import '../domain/usecase/account/select_account_usecase.dart' as _i26;
import '../domain/usecase/auth/change_pin_usecase.dart' as _i15;
import '../domain/usecase/auth/check_has_pin_usecase.dart' as _i16;
import '../domain/usecase/auth/check_mnemonic_valid_usecase.dart' as _i8;
import '../domain/usecase/auth/create_mnemonic_usecase.dart' as _i17;
import '../domain/usecase/auth/create_pin_usecase.dart' as _i18;
import '../domain/usecase/auth/delete_pin_usecase.dart' as _i19;
import '../domain/usecase/auth/import_account_usecase.dart' as _i23;
import '../domain/usecase/auth/match_pin_usecase.dart' as _i24;
import '../domain/usecase/auth/remove_account_usecase.dart' as _i25;
import '../domain/usecase/check_fist_time_run_app_usecase.dart' as _i7;
import '../domain/util/util.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountLocalDatasource>(
      () => _i3.AccountLocalDatasourceImplement());
  gh.factory<_i4.AccountRemoteDatasource>(
      () => _i4.AccountRemoteDatasourceImplement());
  gh.factory<_i5.AccountRepository>(
      () => _i6.AccountRepositoryImplement(get<_i4.AccountRemoteDatasource>()));
  gh.factory<_i7.CheckFirstTimeRunAppUseCase>(
      () => _i7.CheckFirstTimeRunAppUseCase());
  gh.factory<_i8.CheckMnemonicValidUseCase>(
      () => _i8.CheckMnemonicValidUseCase());
  gh.factory<_i9.CreateDBDatasource>(() => _i9.CreateDBDatasourceImpl());
  gh.factory<_i10.CryptoUtils>(() => _i10.CryptoUtils());
  gh.factory<_i11.PinLocalDatasource>(() => _i11.PinLocalDatasourceImplement(
      get<_i12.FlutterSecureStorage>(), get<_i10.CryptoUtils>()));
  gh.factory<_i13.AuthRepository>(() => _i14.AuthRepositoryImplement(
      get<_i11.PinLocalDatasource>(), get<_i3.AccountLocalDatasource>()));
  gh.factory<_i15.ChangePinUseCase>(
      () => _i15.ChangePinUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i16.CheckHasPinUseCase>(
      () => _i16.CheckHasPinUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i17.CreateMnemonicUseCase>(
      () => _i17.CreateMnemonicUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i18.CreatePinUseCase>(
      () => _i18.CreatePinUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i19.DeletePinUseCase>(
      () => _i19.DeletePinUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i20.GetListAccountUseCase>(() =>
      _i20.GetListAccountUseCase(get<_i13.AuthRepository>(), get<_i21.ENV>()));
  gh.factory<_i22.GetSelectedAccountUseCase>(() =>
      _i22.GetSelectedAccountUseCase(
          get<_i13.AuthRepository>(), get<_i21.ENV>()));
  gh.factory<_i23.ImportAccountUseCase>(() =>
      _i23.ImportAccountUseCase(get<_i13.AuthRepository>(), get<_i21.ENV>()));
  gh.factory<_i24.MatchPinUseCase>(
      () => _i24.MatchPinUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i25.RemoveAccountUseCase>(() =>
      _i25.RemoveAccountUseCase(get<_i13.AuthRepository>(), get<_i21.ENV>()));
  gh.factory<_i26.SelectAccountUseCase>(
      () => _i26.SelectAccountUseCase(get<_i13.AuthRepository>()));
  return get;
}
