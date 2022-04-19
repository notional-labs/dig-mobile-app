// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../dig_core.dart' as _i26;
import '../data/datasource/local/account_local_datasource.dart' as _i3;
import '../data/datasource/local/create_db_datasource.dart' as _i9;
import '../data/datasource/local/pin_local_datasource.dart' as _i13;
import '../data/datasource/remote/account_remote_datasource.dart' as _i4;
import '../data/datasource/remote/proposals_remote_datasource.dart' as _i15;
import '../data/repository/account_repository_impl.dart' as _i6;
import '../data/repository/auth_repository_impl.dart' as _i19;
import '../data/repository/proposals_repository_impl.dart' as _i17;
import '../domain/env/env.dart' as _i12;
import '../domain/repository/account_repository.dart' as _i5;
import '../domain/repository/auth_repository.dart' as _i18;
import '../domain/repository/proposals_repository.dart' as _i16;
import '../domain/usecase/account/get_list_account_usecase.dart' as _i25;
import '../domain/usecase/account/get_list_balance_usecase.dart' as _i11;
import '../domain/usecase/account/get_selected_account_usecase.dart' as _i29;
import '../domain/usecase/account/select_account_usecase.dart' as _i33;
import '../domain/usecase/auth/change_pin_usecase.dart' as _i20;
import '../domain/usecase/auth/check_has_pin_usecase.dart' as _i21;
import '../domain/usecase/auth/check_mnemonic_valid_usecase.dart' as _i8;
import '../domain/usecase/auth/create_mnemonic_usecase.dart' as _i22;
import '../domain/usecase/auth/create_pin_usecase.dart' as _i23;
import '../domain/usecase/auth/delete_pin_usecase.dart' as _i24;
import '../domain/usecase/auth/import_account_usecase.dart' as _i30;
import '../domain/usecase/auth/match_pin_usecase.dart' as _i31;
import '../domain/usecase/auth/remove_account_usecase.dart' as _i32;
import '../domain/usecase/check_fist_time_run_app_usecase.dart' as _i7;
import '../domain/usecase/proposals/get_proposals_usecase.dart' as _i27;
import '../domain/usecase/proposals/get_proposer_usecase.dart' as _i28;
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
  gh.factory<_i11.GetListBalanceUseCase>(() => _i11.GetListBalanceUseCase(
      get<_i5.AccountRepository>(), get<_i12.ENV>()));
  gh.factory<_i13.PinLocalDatasource>(() => _i13.PinLocalDatasourceImplement(
      get<_i14.FlutterSecureStorage>(), get<_i10.CryptoUtils>()));
  gh.factory<_i15.ProposalsRemoteDatasource>(
      () => _i15.ProposalsRemoteDatasourceImplement());
  gh.factory<_i16.ProposalsRepository>(() =>
      _i17.ProposalsRepositoryImplement(get<_i15.ProposalsRemoteDatasource>()));
  gh.factory<_i18.AuthRepository>(() => _i19.AuthRepositoryImplement(
      get<_i13.PinLocalDatasource>(), get<_i3.AccountLocalDatasource>()));
  gh.factory<_i20.ChangePinUseCase>(
      () => _i20.ChangePinUseCase(get<_i18.AuthRepository>()));
  gh.factory<_i21.CheckHasPinUseCase>(
      () => _i21.CheckHasPinUseCase(get<_i18.AuthRepository>()));
  gh.factory<_i22.CreateMnemonicUseCase>(
      () => _i22.CreateMnemonicUseCase(get<_i18.AuthRepository>()));
  gh.factory<_i23.CreatePinUseCase>(
      () => _i23.CreatePinUseCase(get<_i18.AuthRepository>()));
  gh.factory<_i24.DeletePinUseCase>(
      () => _i24.DeletePinUseCase(get<_i18.AuthRepository>()));
  gh.factory<_i25.GetListAccountUseCase>(() =>
      _i25.GetListAccountUseCase(get<_i18.AuthRepository>(), get<_i26.ENV>()));
  gh.factory<_i27.GetProposalsUseCase>(() => _i27.GetProposalsUseCase(
      get<_i16.ProposalsRepository>(), get<_i12.ENV>()));
  gh.factory<_i28.GetProposerUseCase>(() => _i28.GetProposerUseCase(
      get<_i16.ProposalsRepository>(), get<_i26.ENV>()));
  gh.factory<_i29.GetSelectedAccountUseCase>(() =>
      _i29.GetSelectedAccountUseCase(
          get<_i18.AuthRepository>(), get<_i26.ENV>()));
  gh.factory<_i30.ImportAccountUseCase>(() =>
      _i30.ImportAccountUseCase(get<_i18.AuthRepository>(), get<_i12.ENV>()));
  gh.factory<_i31.MatchPinUseCase>(
      () => _i31.MatchPinUseCase(get<_i18.AuthRepository>()));
  gh.factory<_i32.RemoveAccountUseCase>(() =>
      _i32.RemoveAccountUseCase(get<_i18.AuthRepository>(), get<_i12.ENV>()));
  gh.factory<_i33.SelectAccountUseCase>(
      () => _i33.SelectAccountUseCase(get<_i18.AuthRepository>()));
  return get;
}
