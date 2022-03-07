import 'package:dig_mobile_app/app/cubit/splash_cubit.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashCubit _cubit = di();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _cubit.checkAuthencation();
    });
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: DSBackground(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppAssets.icDigLogo,
                      width: 104,
                      height: 76,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      S.current.chain.toUpperCase(),
                      style: DSTextStyle.tsMontserrat.copyWith(
                        color: DSColors.tulipTree,
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.current.into_the_mine,
                      style: DSTextStyle.tsMontserrat.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Image.asset(
                      AppAssets.icArrowRight,
                      width: 16,
                      height: 14,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
