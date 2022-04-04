import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/page/active_account/active_account_page.dart';
import 'package:dig_mobile_app/app/page/home/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class HomePage extends StatefulWidget {
  final AccountPublicInfo? accountPublicInfo;

  const HomePage({this.accountPublicInfo, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          drawer: const HomeDrawer(),
          body: DSBackground(
            child: SafeArea(
              child: Column(
                children: [
                  const HomeAppBar(),
                  Expanded(
                    child: ActiveAccountPage(
                      accountPublicInfo: widget.accountPublicInfo,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
              child: Row(
            children: [
              const SizedBox(
                width: 32,
              ),
              GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.menu,
                  color: DSColors.tulipTree,
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
              const Icon(
                Icons.notifications,
                color: DSColors.tulipTree,
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                AppAssets.icScanQr,
                width: 18,
                height: 18,
              ),
              const SizedBox(
                width: 32,
              ),
            ],
          )),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.icDigLogo,
              width: 37,
              height: 27,
            ),
          )
        ],
      ),
    );
  }
}
