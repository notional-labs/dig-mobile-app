import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry? _overlayEntry;

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
      MediaQuery.of(context).orientation ==
      Orientation.landscape;
}

mixin ImageUtil {
  Future precacheImages(List<String> imagePaths) async {
    for (final image in imagePaths) {
      await precacheImage(
          AssetImage(image), navigatorKey.currentState!.context);
    }
  }
}
