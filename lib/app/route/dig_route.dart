import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/create_wallet_flow/backup_your_wallet/backup_your_wallet_page.dart';
import 'package:dig_mobile_app/app/page/create_wallet_flow/recovery_phrase/recovery_phrase_page.dart';
import 'package:dig_mobile_app/app/page/home/home_page.dart';
import 'package:dig_mobile_app/app/page/import_account/import_account_page.dart';
import 'package:dig_mobile_app/app/page/name_account/name_account_page.dart';
import 'package:dig_mobile_app/app/page/sign_in/sign_in_page.dart';
import 'package:dig_mobile_app/app/page/splash/splash.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DigRoute {
  PageRoute generateRoute(RouteSettings settings) {
    final name = settings.name;
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (name) {
      case DigPageName.root:
      case DigPageName.splash:
        return _materialPage(const SplashPage(), settings);
      case DigPageName.signIn:
        return _materialPage(const LoginPage(), settings);
      case DigPageName.home:
        return _materialPage(const HomePage(), settings);
      case DigPageName.backUpYourWallet:
        return _materialPage(const BackUpYourWalletPage(), settings);
      case DigPageName.recoveryPhrase:
        final mnemonic = (args as String?) ?? '';
        return _materialPage(RecoveryPhrasePage(mnemonic: mnemonic), settings);
      case DigPageName.importAccount:
        return _materialPage(const ImportAccountPage(), settings);
      case DigPageName.nameAccount:
        final String mnemonic = (args as String?) ?? '';
        return _materialPage(
            NameAccountPage(
              param: NameAccountPageParam(mnemonic: mnemonic),
            ),
            settings);
      default:
        return _materialPage(const SizedBox.shrink(), settings);
    }
  }

  MaterialPageRoute _materialPage(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
