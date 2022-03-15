import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSPrimaryAppBar extends StatelessWidget {
  final String title;
  final GestureTapCallback? onBackButtonPressed;

  const DSPrimaryAppBar({
    this.title = '',
    this.onBackButtonPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: [
      if (onBackButtonPressed != null)
        InkResponse(
          onTap: onBackButtonPressed,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: DSColors.tulipTree,
              size: 24,
            ),
          ),
        ),
      Expanded(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: DSTextStyle.tsMontserrat.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            color: DSColors.tulipTree,
          ),
        ),
      ),
      if (onBackButtonPressed != null)
        const SizedBox(
          width: 50,
        )
    ],
  );
}
