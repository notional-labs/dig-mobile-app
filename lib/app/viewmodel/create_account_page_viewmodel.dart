import 'package:equatable/equatable.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:dig_mobile_app/generated/l10n.dart';

class CreateAccountPageViewmodel extends Equatable {
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final bool acceptTerm;
  const CreateAccountPageViewmodel({
    this.firstname = '',
    this.lastname = '',
    this.email = '',
    this.password = '',
    this.acceptTerm = false,
  });

  bool get isFormValid {
    if (email.isEmpty ||
        password.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        !acceptTerm) {
      return false;
    }

    final emailValidatorErrorMessage =
        EmailValidator(errorText: S.current.sign_up_form_hint_invalid_email)
                .call(email) ??
            '';

    return emailValidatorErrorMessage.isEmpty;
  }

  CreateAccountPageViewmodel copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    bool? acceptTerm,
  }) {
    return CreateAccountPageViewmodel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      acceptTerm: acceptTerm ?? this.acceptTerm,
    );
  }

  @override
  List<Object> get props {
    return [
      firstname,
      lastname,
      email,
      password,
      acceptTerm,
    ];
  }
}
