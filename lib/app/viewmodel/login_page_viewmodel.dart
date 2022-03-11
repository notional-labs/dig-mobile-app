import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPageViewmodel extends Equatable {
  final String email;
  final String password;
  const LoginPageViewmodel({
    this.email = '',
    this.password = '',
  });

  bool get isFormValid {
    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    final emailValidatorErrorMessage =
        EmailValidator(errorText: S.current.sign_up_form_hint_invalid_email)
                .call(email) ??
            '';

    return emailValidatorErrorMessage.isEmpty;
  }

  LoginPageViewmodel copyWith({
    String? email,
    String? password,
  }) {
    return LoginPageViewmodel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email, password];
}
