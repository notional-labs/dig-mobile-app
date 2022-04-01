import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSSmallButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final bool enable;

  const DSSmallButton({
    required this.title,
    required this.onTap,
    this.enable = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: enable ? onTap : null,
      child: Container(
        decoration: const BoxDecoration(
          color: DSColors.yellowOrange,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        width: 66,
        height: 30,
        child: Align(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: DSTextStyle.tsMontserratT10R.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ));
}
