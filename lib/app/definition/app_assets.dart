class AppAssets {
  static const String _rootImagePath = 'lib/assets/images/';

  static String _generateImagePath(String imageName) =>
      '$_rootImagePath$imageName';

  static final String icDigLogo = _generateImagePath('ic_dig_logo.png');
  static final String icArrowRight = _generateImagePath('ic_arrow_right.png');
  static final String icScanQr = _generateImagePath('ic_scan_qr.png');
}
