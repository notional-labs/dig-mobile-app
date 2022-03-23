import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry? _overlayEntry;
DSSnackBar? _snackBar;

mixin WidgetUtil {
  void showGlobalLoadingOverlay() {
    dismissGlobalLoadingOverlay();
    _overlayEntry = showOverlay(
        (_, __) => Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(),
            )),
        duration: const Duration(hours: 100));
  }

  void dismissGlobalLoadingOverlay() {
    _overlayEntry?.dismiss(animate: false);
  }

  void closeGlobalKeyboard() {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
  }

  bool checkLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  bool checkKeyboardOpening(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom != 0;

  void showGlobalDSSnackBar(
      {required String message, DSSnackBarType type = DSSnackBarType.success}) {
    _snackBar = DSSnackBar(message: message, type: type);
    _snackBar!.show();
  }

  void dismissGlobalSnackBar() {
    _snackBar?.dismiss(true);
  }
}

mixin ImageUtil {
  Future precacheImages(List<String> imagePaths) async {
    for (final image in imagePaths) {
      await precacheImage(
          AssetImage(image), navigatorKey.currentState!.context);
    }
  }
}
