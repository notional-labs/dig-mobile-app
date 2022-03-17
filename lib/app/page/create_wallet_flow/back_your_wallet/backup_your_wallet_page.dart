import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_plain_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackUpYourWalletPage extends StatelessWidget {
  const BackUpYourWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: DSBackground(
        child: Stack(
          children: [
            Positioned.directional(
              textDirection: TextDirection.ltr,
              child: DSPrimaryAppBar(
                onBackButtonPressed: () => Navigator.of(context).pop(),
              ),
              top: 50,
              start: 0,
              end: 0,
            ),
            Positioned.directional(
                top: 80,
                start: 0,
                end: 0,
                bottom: 0,
                textDirection: TextDirection.ltr,
                child: _buildBody())
          ],
        ),
      )),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.back_up_your_wallet,
            style: DSTextStyle.tsMontserrat.copyWith(
                color: DSColors.tulipTree,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            S.current.back_up_your_wallet_description,
            style: DSTextStyle.tsMontserrat.copyWith(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 34,
          ),
          _ReminderBox(text: S.current.back_up_your_wallet_reminder_1),
          const SizedBox(
            height: 25,
          ),
          _ReminderBox(text: S.current.back_up_your_wallet_reminder_2),
          const SizedBox(
            height: 25,
          ),
          _ReminderBox(text: S.current.back_up_your_wallet_reminder_3),
          const SizedBox(
            height: 40,
          ),
          DSPrimaryButton(title: S.current.back_up_now, onTap: () {
            navigatorKey.currentState!.pushNamed(DigPageName.recoveryPhrase);
          }),
          const SizedBox(
            height: 16,
          ),
          DSPlainButton(title: S.current.back_up_later, onTap: () {})
        ],
      ),
    );
  }
}

class _ReminderBox extends StatelessWidget {
  final String text;

  const _ReminderBox({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 6),
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                  color: DSColors.tulipTree, shape: BoxShape.circle),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: DSTextStyle.tsMontserrat.copyWith(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
