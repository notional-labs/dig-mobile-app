import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:flutter/material.dart';

class DSBackground extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  const DSBackground(
      {required this.child,
      this.gradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [DSColors.codGray, DSColors.tundora]),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(gradient: gradient),
      child: child,
    );
  }
}
