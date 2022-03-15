class AppAssets {
  static const String _rootImagePath = 'lib/assets/images/';

  static String _generateImagePath(String imageName) =>
      '$_rootImagePath$imageName';

  static final String icDigLogo = _generateImagePath('ic_dig_logo.png');
  static final String icArrowRight = _generateImagePath('ic_arrow_right.png');
  static final String icScanQr = _generateImagePath('ic_scan_qr.png');
  static final String icDiggerHead = _generateImagePath('ic_digger_head.png');
  static final String icCopy = _generateImagePath('ic_copy.png');
  static final String icSolidCoins = _generateImagePath('ic_solid_coins.png');
  static final String icArrowUpRight =
      _generateImagePath('ic_arrow_up_right.png');
  static final String icArrowExchange =
      _generateImagePath('ic_arrow_exchange.png');
  static final String icDelete = _generateImagePath('ic_delete.png');
  static final String icDigLogoWithText =
      _generateImagePath('ic_dig_logo_with_text.png');
  static final String icEye = _generateImagePath('ic_eye.png');
  static final String icApple = _generateImagePath('ic_apple.png');
  static final String icFacebook = _generateImagePath('ic_facebook.png');
  static final String icTwitter = _generateImagePath('ic_twitter.png');
  static final String icGoogle = _generateImagePath('ic_google.png');
  static final String icImportAccount =
      _generateImagePath('ic_import_account.png');
  static final String icCreateAccount =
      _generateImagePath('ic_create_account.png');
}
