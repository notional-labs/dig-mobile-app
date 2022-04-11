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
  static const String getProposals = 'cosmos/gov/v1beta1/proposals';
}

abstract class GetItInstanceName {
  static const String restClientDigChain = 'REST_CLIENT_DIG_CHAIN';
}

abstract class DataErrorMessage {
  static const String networkError = 'Please check your connect';
  static const String derivatorNotFound = 'Derivator Not Found';
  static const String unknowError = 'Unknow Error';
}