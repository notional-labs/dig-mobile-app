abstract class HttpCode {
  /// TODO: Ask BE for correct [expiredToken]
  static int expiredToken = 10000000;
}

abstract class FirestoreCollection {
  static const String user = 'user';
}

abstract class ErrorMessage {
  static const String defaultLoginError = 'Login error, please try again!';
}

abstract class DigKey {
  static const String pin = 'DIG_PIN';
  static const String accountId = 'ACCOUNT_ID';
}
