import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSPrimaryButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  const DSPrimaryButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [DSColors.tulipTree, DSColors.yellowOrange])),
          width: double.infinity,
          height: 50,
          child: Align(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: DSTextStyle.tsMontserrat.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      );
}
