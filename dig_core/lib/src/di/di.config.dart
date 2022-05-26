// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../dig_core.dart' as _i38;
import '../data/datasource/local/account_local_datasource.dart' as _i3;
import '../data/datasource/local/create_db_datasource.dart' as _i9;
import '../data/datasource/local/pin_local_datasource.dart' as _i18;
import '../data/datasource/remote/account_remote_datasource.dart' as _i4;
import '../data/datasource/remote/delegation_remote_datasource.dart' as _i11;
import '../data/datasource/remote/proposals_remote_datasource.dart' as _i20;
import '../data/datasource/remote/validator_remote_datasource.dart' as _i25;
import '../data/repository/account_repository_impl.dart' as _i6;
import '../data/repository/auth_repository_impl.dart' as _i29;
import '../data/repository/delegation_repository_impl.dart' as _i13;
import '../data/repository/proposals_repository_impl.dart' as _i22;
import '../data/repository/transaction_repository_impl.dart' as _i24;
import '../data/repository/validator_repository_impl.dart' as _i27;
import '../domain/env/env.dart' as _i15;
import '../domain/repository/account_repository.dart' as _i5;
import '../domain/repository/auth_repository.dart' as _i28;
import '../domain/repository/delegation_repository.dart' as _i12;
import '../domain/repository/proposals_repository.dart' as _i21;
import '../domain/repository/transaction_repository.dart' as _i23;
import '../domain/repository/validator_repository.dart' as _i26;
import '../domain/usecase/account/get_balance_usecase.dart' as _i14;
import '../domain/usecase/account/get_list_account_usecase.dart' as _i35;
import '../domain/usecase/account/get_list_balance_usecase.dart' as _i17;
import '../domain/usecase/account/get_selected_account_usecase.dart' as _i39;
import '../domain/usecase/account/select_account_usecase.dart' as _i45;
import '../domain/usecase/auth/change_pin_usecase.dart' as _i30;
import '../domain/usecase/auth/check_has_pin_usecase.dart' as _i31;
import '../domain/usecase/auth/check_mnemonic_valid_usecase.dart' as _i8;
import '../domain/usecase/auth/create_mnemonic_usecase.dart' as _i32;
import '../domain/usecase/auth/create_pin_usecase.dart' as _i33;
import '../domain/usecase/auth/delete_pin_usecase.dart' as _i34;
import '../domain/usecase/auth/import_account_usecase.dart' as _i42;
import '../domain/usecase/auth/match_pin_usecase.dart' as _i43;
import '../domain/usecase/auth/remove_account_usecase.dart' as _i44;
import '../domain/usecase/check_fist_time_run_app_usecase.dart' as _i7;
import '../domain/usecase/delegation/get_delegations_usecase.dart' as _i16;
import '../domain/usecase/proposals/get_proposals_usecase.dart' as _i36;
import '../domain/usecase/proposals/get_proposer_usecase.dart' as _i37;
import '../domain/usecase/transaction/send_token_use_case.dart' as _i46;
import '../domain/usecase/validator/get_validator_logo_usecase.dart' as _i40;
import '../domain/usecase/validator/get_validator_usecase.dart' as _i41;
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
  gh.factory<_i11.DelegationRemoteDataSource>(
      () => _i11.DelegationRemoteDataSourceImpl());
  gh.factory<_i12.DelegationRepository>(() =>
      _i13.DelegationRepositoryImpl(get<_i11.DelegationRemoteDataSource>()));
  gh.factory<_i14.GetBalanceUseCase>(() =>
      _i14.GetBalanceUseCase(get<_i5.AccountRepository>(), get<_i15.ENV>()));
  gh.factory<_i16.GetDelegationsUseCase>(() => _i16.GetDelegationsUseCase(
      get<_i12.DelegationRepository>(), get<_i15.ENV>()));
  gh.factory<_i17.GetListBalanceUseCase>(() => _i17.GetListBalanceUseCase(
      get<_i5.AccountRepository>(), get<_i15.ENV>()));
  gh.factory<_i18.PinLocalDatasource>(() => _i18.PinLocalDatasourceImplement(
      get<_i19.FlutterSecureStorage>(), get<_i10.CryptoUtils>()));
  gh.factory<_i20.ProposalsRemoteDatasource>(
      () => _i20.ProposalsRemoteDatasourceImplement());
  gh.factory<_i21.ProposalsRepository>(() =>
      _i22.ProposalsRepositoryImplement(get<_i20.ProposalsRemoteDatasource>()));
  gh.factory<_i23.TransactionRepository>(
      () => _i24.TransactionRepositoryImplement());
  gh.factory<_i25.ValidatorRemmoteDatasource>(
      () => _i25.ValidatorRemmoteDatasourceImplement());
  gh.factory<_i26.ValidatorRepository>(() => _i27.ValidatorRepositoryImplement(
      get<_i25.ValidatorRemmoteDatasource>()));
  gh.factory<_i28.AuthRepository>(() => _i29.AuthRepositoryImplement(
      get<_i18.PinLocalDatasource>(), get<_i3.AccountLocalDatasource>()));
  gh.factory<_i30.ChangePinUseCase>(
      () => _i30.ChangePinUseCase(get<_i28.AuthRepository>()));
  gh.factory<_i31.CheckHasPinUseCase>(
      () => _i31.CheckHasPinUseCase(get<_i28.AuthRepository>()));
  gh.factory<_i32.CreateMnemonicUseCase>(
      () => _i32.CreateMnemonicUseCase(get<_i28.AuthRepository>()));
  gh.factory<_i33.CreatePinUseCase>(
      () => _i33.CreatePinUseCase(get<_i28.AuthRepository>()));
  gh.factory<_i34.DeletePinUseCase>(
      () => _i34.DeletePinUseCase(get<_i28.AuthRepository>()));
  gh.factory<_i35.GetListAccountUseCase>(() =>
      _i35.GetListAccountUseCase(get<_i28.AuthRepository>(), get<_i15.ENV>()));
  gh.factory<_i36.GetProposalsUseCase>(() => _i36.GetProposalsUseCase(
      get<_i21.ProposalsRepository>(), get<_i15.ENV>()));
  gh.factory<_i37.GetProposerUseCase>(() => _i37.GetProposerUseCase(
      get<_i21.ProposalsRepository>(), get<_i38.ENV>()));
  gh.factory<_i39.GetSelectedAccountUseCase>(() =>
      _i39.GetSelectedAccountUseCase(
          get<_i28.AuthRepository>(), get<_i38.ENV>()));
  gh.factory<_i40.GetValidatorLogoUseCase>(() => _i40.GetValidatorLogoUseCase(
      get<_i26.ValidatorRepository>(), get<_i15.ENV>()));
  gh.factory<_i41.GetValidatorUseCase>(() => _i41.GetValidatorUseCase(
      get<_i26.ValidatorRepository>(), get<_i15.ENV>()));
  gh.factory<_i42.ImportAccountUseCase>(() =>
      _i42.ImportAccountUseCase(get<_i28.AuthRepository>(), get<_i15.ENV>()));
  gh.factory<_i43.MatchPinUseCase>(
      () => _i43.MatchPinUseCase(get<_i28.AuthRepository>()));
  gh.factory<_i44.RemoveAccountUseCase>(() =>
      _i44.RemoveAccountUseCase(get<_i28.AuthRepository>(), get<_i15.ENV>()));
  gh.factory<_i45.SelectAccountUseCase>(
      () => _i45.SelectAccountUseCase(get<_i28.AuthRepository>()));
  gh.factory<_i46.SendTokenUsecase>(() => _i46.SendTokenUsecase(
      get<_i23.TransactionRepository>(), get<_i38.ENV>()));
  return get;
}
