import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';

enum DSRoundedButtonActionType { buy, send, exchange, delete, none }

class DSRoundedButton extends StatelessWidget {
  final DSRoundedButtonActionType actionType;
  final String? text;
  final String? icon;

  const DSRoundedButton(
      {this.actionType = DSRoundedButtonActionType.none,
      this.text,
      this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
              color: DSColors.tulipTree, shape: BoxShape.circle),
          child: Image.asset(icon ?? _getIconByType()),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text ?? _getTextByType(),
          style: DSTextStyle.tsMontserrat.copyWith(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
        )
      ],
    );
  }

  String _getIconByType() {
    switch (actionType) {
      case DSRoundedButtonActionType.buy:
        return AppAssets.icSolidCoins;
      case DSRoundedButtonActionType.send:
        return AppAssets.icArrowUpRight;
      case DSRoundedButtonActionType.exchange:
        return AppAssets.icArrowExchange;
      case DSRoundedButtonActionType.delete:
        return AppAssets.icDelete;
      case DSRoundedButtonActionType.none:
        return '';
    }
  }

  String _getTextByType() {
    switch (actionType) {
      case DSRoundedButtonActionType.buy:
        return S.current.buy;
      case DSRoundedButtonActionType.send:
        return S.current.send;
      case DSRoundedButtonActionType.exchange:
        return S.current.exchange;
      case DSRoundedButtonActionType.delete:
        return S.current.delete;
      case DSRoundedButtonActionType.none:
        return '';
    }
  }
}
