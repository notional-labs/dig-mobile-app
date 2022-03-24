// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasource/local/create_db_datasource.dart' as _i6;
import '../data/repository/auth_repository_impl.dart' as _i4;
import '../domain/repository/auth_repository.dart' as _i3;
import '../domain/usecase/auth/get_selected_account_usecase.dart' as _i8;
import '../domain/usecase/check_mnemonic_valid_usecase.dart' as _i5;
import '../domain/usecase/create_mnemonic_usecase.dart' as _i7;
import '../domain/usecase/import_account_usecase.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthRepository>(() => _i4.AuthRepositoryImplement());
  gh.factory<_i5.CheckMnemonicValidUseCase>(
      () => _i5.CheckMnemonicValidUseCase());
  gh.factory<_i6.CreateDBDatasource>(() => _i6.CreateDBDatasourceImpl());
  gh.factory<_i7.CreateMnemonicUseCase>(
      () => _i7.CreateMnemonicUseCase(get<_i3.AuthRepository>()));
  gh.factory<_i8.GetSelectedAccountUseCase>(
      () => _i8.GetSelectedAccountUseCase(get<_i3.AuthRepository>()));
  gh.factory<_i9.ImportAccountUseCase>(
      () => _i9.ImportAccountUseCase(get<_i3.AuthRepository>()));
  return get;
}
