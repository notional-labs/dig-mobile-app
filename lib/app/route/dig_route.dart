import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/home/home_page.dart';
import 'package:dig_mobile_app/app/page/splash/splash.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DigRoute {
  PageRoute generateRoute(RouteSettings settings) {
    final name = settings.name;
    final args = settings.arguments;

    switch (name) {
      case DigPageName.root:
      case DigPageName.splash:
        return _materialPage(const SplashPage(), settings);
      case DigPageName.logIn:
      case DigPageName.home:
        return _materialPage(const HomePage(), settings);
      default:
        return _materialPage(const SizedBox.shrink(), settings);
    }
  }

  MaterialPageRoute _materialPage(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
