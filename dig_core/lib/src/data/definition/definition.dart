abstract class DigKey {
  static const String pin = 'DIG_PIN';
  static const String accountId = 'ACCOUNT_ID';
}

abstract class HttpCode {
  /// TODO: Ask BE for correct [expiredToken]
  static int expiredToken = 10000000;
}

abstract class EndPoint {
  static const String getBalancePath = 'cosmos/bank/v1beta1/balances/{address}';
}

abstract class GetItInstanceName {
  static const String restClientDigChain = 'REST_CLIENT_DIG_CHAIN';
}
