import 'package:dig_mobile_app/app/definition/locale.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        initialRoute: DigPageName.splash,
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) => DigRoute().generateRoute(settings),
        supportedLocales: DigLocale.supportedLocale,
        /// TODO: Uncomment after setup Firebase
        // navigatorObservers: <NavigatorObserver>[
        //   FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance)
        // ],
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          final hasSupported = supportedLocales
              .any((element) => element == locale);
          if (hasSupported) {
            return locale;
          }
          return DigLocale.defaultLocale;
        },
      ),
    );
  }
}
