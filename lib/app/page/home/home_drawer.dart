import 'package:dig_mobile_app/app/designsystem/custom/ds_avatar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: DSColors.tundora,
      child: Container(
        padding: const EdgeInsets.fromLTRB(32.0, 40.0, 32.0, 8.0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DSAvatar(),
                Expanded(child: SizedBox.shrink()),
                Icon(
                  Icons.settings_outlined,
                  color: DSColors.tulipTree,
                  size: 25,
                )
              ],
            ),
            Text(
              'Janne Copper',
              style: DSTextStyle.tsMontserrat.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Divider(
                height: 1,
                color: DSColors.tulipTree,
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const _CreateAccountButton(),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Text(
                    'STAKING',
                    style: DSTextStyle.tsMontserrat.copyWith(
                      color: DSColors.tulipTree,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: DSColors.tulipTree,
                    size: 22,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Text(
                    'PROPOSALS',
                    style: DSTextStyle.tsMontserrat.copyWith(
                      color: DSColors.tulipTree,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const Expanded(child: SizedBox.shrink()),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: DSColors.tulipTree,
                    size: 22,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: const [6, 6],
      radius: const Radius.circular(5),
      color: DSColors.tulipTree,
      child: SizedBox(
          width: double.infinity,
          height: 38,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.add,
                  color: DSColors.tulipTree,
                  size: 22,
                ),
              ),
              Text(
                'New account',
                style: DSTextStyle.tsMontserrat.copyWith(
                  color: DSColors.tulipTree,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              )
            ],
          )),
    );
  }
}
