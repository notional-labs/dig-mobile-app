import 'package:dig_core/src/domain/model/import_account_form_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ImportAccount extends Equatable {
  final ImportAccountFormData importAccountFormData;
  final VoidCallback? onAccountCreationStarted;
  const ImportAccount({
    required this.importAccountFormData,
    this.onAccountCreationStarted,
  });

  ImportAccount copyWith({
    ImportAccountFormData? data,
    VoidCallback? onAccountCreationStarted,
  }) {
    return ImportAccount(
      importAccountFormData: data ?? this.importAccountFormData,
      onAccountCreationStarted:
          onAccountCreationStarted ?? this.onAccountCreationStarted,
    );
  }

  @override
  List<Object?> get props => [importAccountFormData, onAccountCreationStarted];
}
