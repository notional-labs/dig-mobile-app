// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../dig_core.dart' as _i30;
import '../data/datasource/local/account_local_datasource.dart' as _i3;
import '../data/datasource/local/create_db_datasource.dart' as _i9;
import '../data/datasource/local/pin_local_datasource.dart' as _i14;
import '../data/datasource/remote/account_remote_datasource.dart' as _i4;
import '../data/datasource/remote/proposals_remote_datasource.dart' as _i16;
import '../data/datasource/remote/validator_remote_datasource.dart' as _i19;
import '../data/repository/account_repository_impl.dart' as _i6;
import '../data/repository/auth_repository_impl.dart' as _i23;
import '../data/repository/proposals_repository_impl.dart' as _i18;
import '../data/repository/validator_repository_impl.dart' as _i21;
import '../domain/env/env.dart' as _i12;
import '../domain/repository/account_repository.dart' as _i5;
import '../domain/repository/auth_repository.dart' as _i22;
import '../domain/repository/proposals_repository.dart' as _i17;
import '../domain/repository/validator_repository.dart' as _i20;
import '../domain/usecase/account/get_balance_usecase.dart' as _i11;
import '../domain/usecase/account/get_list_account_usecase.dart' as _i29;
import '../domain/usecase/account/get_list_balance_usecase.dart' as _i13;
import '../domain/usecase/account/get_selected_account_usecase.dart' as _i33;
import '../domain/usecase/account/select_account_usecase.dart' as _i39;
import '../domain/usecase/auth/change_pin_usecase.dart' as _i24;
import '../domain/usecase/auth/check_has_pin_usecase.dart' as _i25;
import '../domain/usecase/auth/check_mnemonic_valid_usecase.dart' as _i8;
import '../domain/usecase/auth/create_mnemonic_usecase.dart' as _i26;
import '../domain/usecase/auth/create_pin_usecase.dart' as _i27;
import '../domain/usecase/auth/delete_pin_usecase.dart' as _i28;
import '../domain/usecase/auth/import_account_usecase.dart' as _i36;
import '../domain/usecase/auth/match_pin_usecase.dart' as _i37;
import '../domain/usecase/auth/remove_account_usecase.dart' as _i38;
import '../domain/usecase/check_fist_time_run_app_usecase.dart' as _i7;
import '../domain/usecase/proposals/get_proposals_usecase.dart' as _i31;
import '../domain/usecase/proposals/get_proposer_usecase.dart' as _i32;
import '../domain/usecase/validator/get_validator_logo_usecase.dart' as _i34;
import '../domain/usecase/validator/get_validator_usecase.dart' as _i35;
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
  gh.factory<_i11.GetBalanceUseCase>(() =>
      _i11.GetBalanceUseCase(get<_i5.AccountRepository>(), get<_i12.ENV>()));
  gh.factory<_i13.GetListBalanceUseCase>(() => _i13.GetListBalanceUseCase(
      get<_i5.AccountRepository>(), get<_i12.ENV>()));
  gh.factory<_i14.PinLocalDatasource>(() => _i14.PinLocalDatasourceImplement(
      get<_i15.FlutterSecureStorage>(), get<_i10.CryptoUtils>()));
  gh.factory<_i16.ProposalsRemoteDatasource>(
      () => _i16.ProposalsRemoteDatasourceImplement());
  gh.factory<_i17.ProposalsRepository>(() =>
      _i18.ProposalsRepositoryImplement(get<_i16.ProposalsRemoteDatasource>()));
  gh.factory<_i19.ValidatorRemmoteDatasource>(
      () => _i19.ValidatorRemmoteDatasourceImplement());
  gh.factory<_i20.ValidatorRepository>(() => _i21.ValidatorRepositoryImplement(
      get<_i19.ValidatorRemmoteDatasource>()));
  gh.factory<_i22.AuthRepository>(() => _i23.AuthRepositoryImplement(
      get<_i14.PinLocalDatasource>(), get<_i3.AccountLocalDatasource>()));
  gh.factory<_i24.ChangePinUseCase>(
      () => _i24.ChangePinUseCase(get<_i22.AuthRepository>()));
  gh.factory<_i25.CheckHasPinUseCase>(
      () => _i25.CheckHasPinUseCase(get<_i22.AuthRepository>()));
  gh.factory<_i26.CreateMnemonicUseCase>(
      () => _i26.CreateMnemonicUseCase(get<_i22.AuthRepository>()));
  gh.factory<_i27.CreatePinUseCase>(
      () => _i27.CreatePinUseCase(get<_i22.AuthRepository>()));
  gh.factory<_i28.DeletePinUseCase>(
      () => _i28.DeletePinUseCase(get<_i22.AuthRepository>()));
  gh.factory<_i29.GetListAccountUseCase>(() =>
      _i29.GetListAccountUseCase(get<_i22.AuthRepository>(), get<_i30.ENV>()));
  gh.factory<_i31.GetProposalsUseCase>(() => _i31.GetProposalsUseCase(
      get<_i17.ProposalsRepository>(), get<_i12.ENV>()));
  gh.factory<_i32.GetProposerUseCase>(() => _i32.GetProposerUseCase(
      get<_i17.ProposalsRepository>(), get<_i30.ENV>()));
  gh.factory<_i33.GetSelectedAccountUseCase>(() =>
      _i33.GetSelectedAccountUseCase(
          get<_i22.AuthRepository>(), get<_i30.ENV>()));
  gh.factory<_i34.GetValidatorLogoUseCase>(() => _i34.GetValidatorLogoUseCase(
      get<_i20.ValidatorRepository>(), get<_i12.ENV>()));
  gh.factory<_i35.GetValidatorUseCase>(() => _i35.GetValidatorUseCase(
      get<_i20.ValidatorRepository>(), get<_i12.ENV>()));
  gh.factory<_i36.ImportAccountUseCase>(() =>
      _i36.ImportAccountUseCase(get<_i22.AuthRepository>(), get<_i12.ENV>()));
  gh.factory<_i37.MatchPinUseCase>(
      () => _i37.MatchPinUseCase(get<_i22.AuthRepository>()));
  gh.factory<_i38.RemoveAccountUseCase>(() =>
      _i38.RemoveAccountUseCase(get<_i22.AuthRepository>(), get<_i12.ENV>()));
  gh.factory<_i39.SelectAccountUseCase>(
      () => _i39.SelectAccountUseCase(get<_i22.AuthRepository>()));
  return get;
}
