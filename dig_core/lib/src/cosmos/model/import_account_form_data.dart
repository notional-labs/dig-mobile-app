import 'package:dig_core/src/cosmos/model/account_additional_data.dart';

class ImportAccountFormData {
  const ImportAccountFormData({
    required this.mnemonic,
    required this.name,
    required this.password,
    required this.additionalData,
  });

  final String mnemonic;
  final String name;
  final String password;
  final AccountAdditionalData additionalData;
}
