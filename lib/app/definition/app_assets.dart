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
  static final String icArrowUpRight = _generateImagePath('ic_arrow_up_right.png');
  static final String icArrowExchange = _generateImagePath('ic_arrow_exchange.png');
  static final String icDelete = _generateImagePath('ic_delete.png');
}
