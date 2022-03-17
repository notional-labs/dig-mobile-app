import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSPrimaryButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final bool enable;
  const DSPrimaryButton({
    required this.title,
    required this.onTap,
    this.enable = true,
    Key? key,
  }) : super(key: key);

  LinearGradient get _resolveBackgroudColor => enable
      ? const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [DSColors.tulipTree, DSColors.yellowOrange])
      : const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [DSColors.silver2, DSColors.silver2]);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              gradient: _resolveBackgroudColor),
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
