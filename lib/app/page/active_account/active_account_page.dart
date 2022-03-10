import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_avatar.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_rounded_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/extension/extension.dart';
import 'package:flutter/material.dart';

class ActiveAccountPage extends StatefulWidget {
  const ActiveAccountPage({Key? key}) : super(key: key);

  @override
  State<ActiveAccountPage> createState() => _ActiveAccountPageState();
}

class _ActiveAccountPageState extends State<ActiveAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20),
          child: DSAvatar(
            backgroundColor: DSColors.silver2,
          ),
        ),
        Text(
          'Account 1',
          style: DSTextStyle.tsMontserrat.copyWith(
              color: DSColors.tulipTree,
              fontSize: 20,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          '\$100',
          style: DSTextStyle.tsMontserrat.copyWith(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 12,
        ),
        const _WalletAddress(address: 'digbhfjh3455asdaadasdasdasdasasdasdahis'),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 54, right: 54, bottom: 34),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              DSRoundedButton(actionType: DSRoundedButtonActionType.buy,),
              DSRoundedButton(actionType: DSRoundedButtonActionType.send,),
              DSRoundedButton(actionType: DSRoundedButtonActionType.exchange,),
              DSRoundedButton(actionType: DSRoundedButtonActionType.delete,)
            ],
          ),
        )
      ],
    );
  }
}

class _WalletAddress extends StatelessWidget {
  final String address;

  const _WalletAddress({required this.address, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 86),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: DSColors.silver2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              address.length > 20 ? address.trimMiddleWithDot(23) : address,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: DSTextStyle.tsMontserrat.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: DSColors.tundora,
                  overflow: TextOverflow.clip),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            AppAssets.icCopy,
            width: 18,
            height: 18,
          )
        ],
      ),
    );
  }
}
