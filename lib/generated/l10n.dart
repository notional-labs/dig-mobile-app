// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ig CHAIN`
  String get ig_chain {
    return Intl.message(
      'ig CHAIN',
      name: 'ig_chain',
      desc: '',
      args: [],
    );
  }

  /// `into the mine`
  String get into_the_mine {
    return Intl.message(
      'into the mine',
      name: 'into_the_mine',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Exchange`
  String get exchange {
    return Intl.message(
      'Exchange',
      name: 'exchange',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `ig`
  String get ig {
    return Intl.message(
      'ig',
      name: 'ig',
      desc: '',
      args: [],
    );
  }

  /// `WELCOME`
  String get wellcome {
    return Intl.message(
      'WELCOME',
      name: 'wellcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign in on your account`
  String get sign_in_on_your_account {
    return Intl.message(
      'Sign in on your account',
      name: 'sign_in_on_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get or_sign_in_with {
    return Intl.message(
      'Or sign in with',
      name: 'or_sign_in_with',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have account? Create`
  String get dont_have_account_create {
    return Intl.message(
      'Don’t have account? Create',
      name: 'dont_have_account_create',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © 2021 Digchain.`
  String get copyright_2021_digchain {
    return Intl.message(
      'Copyright © 2021 Digchain.',
      name: 'copyright_2021_digchain',
      desc: '',
      args: [],
    );
  }

  /// `Forgot you Password ?`
  String get forgot_you_password {
    return Intl.message(
      'Forgot you Password ?',
      name: 'forgot_you_password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get sign_up_form_hint_invalid_email {
    return Intl.message(
      'Invalid Email',
      name: 'sign_up_form_hint_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get create_your_account {
    return Intl.message(
      'Create your account',
      name: 'create_your_account',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `{a}*`
  String a_with_asterisk(Object a) {
    return Intl.message(
      '$a*',
      name: 'a_with_asterisk',
      desc: '',
      args: [a],
    );
  }

  /// `I accpect all terms and conditions`
  String get i_accpect_all_terms_and_conditions {
    return Intl.message(
      'I accpect all terms and conditions',
      name: 'i_accpect_all_terms_and_conditions',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
