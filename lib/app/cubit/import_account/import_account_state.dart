import 'package:dig_mobile_app/app/viewmodel/import_account_viewmodel.dart';
import 'package:equatable/equatable.dart';

abstract class ImportAccountState extends Equatable {
  final ImportAccountViewmodel viewmodel;

  const ImportAccountState({this.viewmodel = const ImportAccountViewmodel()});

  @override
  List<Object?> get props => [viewmodel];
}

class ImportAccountPrimaryState extends ImportAccountState {
  const ImportAccountPrimaryState(
      {ImportAccountViewmodel viewmodel = const ImportAccountViewmodel()})
      : super(viewmodel: viewmodel);
}

class ImportAccountLoadingState extends ImportAccountState {
  const ImportAccountLoadingState(
      {ImportAccountViewmodel viewmodel = const ImportAccountViewmodel()})
      : super(viewmodel: viewmodel);
}

class ImportAccountSuccessState extends ImportAccountState {
  const ImportAccountSuccessState(
      {ImportAccountViewmodel viewmodel = const ImportAccountViewmodel()})
      : super(viewmodel: viewmodel);
}

class ImportAccountErrorState extends ImportAccountState {
  const ImportAccountErrorState(
      {ImportAccountViewmodel viewmodel = const ImportAccountViewmodel()})
      : super(viewmodel: viewmodel);
}

class ImportAccountChangedFormState extends ImportAccountState {
  const ImportAccountChangedFormState(
      {ImportAccountViewmodel viewmodel = const ImportAccountViewmodel()})
      : super(viewmodel: viewmodel);
}
