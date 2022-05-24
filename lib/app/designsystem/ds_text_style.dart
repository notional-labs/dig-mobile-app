import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DSTextStyle {
  static TextStyle get tsMontserrat => GoogleFonts.montserrat();

  static TextStyle get tsMontserratT10R =>
     tsMontserrat.copyWith(fontSize: 10, fontWeight: FontWeight.normal);

  static TextStyle get tsMontserratT10B =>
      tsMontserrat.copyWith(fontSize: 10, fontWeight: FontWeight.w700);

  static TextStyle get tsMontserratT12R =>
      tsMontserrat.copyWith(fontSize: 12, fontWeight: FontWeight.normal);

  static TextStyle get tsMontserratT12B =>
      tsMontserrat.copyWith(fontSize: 12, fontWeight: FontWeight.bold);

  static TextStyle get tsMontserratT16R =>
      tsMontserrat.copyWith(fontSize: 16, fontWeight: FontWeight.w400);

  static TextStyle get tsMontserratT16M =>
      tsMontserrat.copyWith(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle get tsMontserratT16B =>
      tsMontserrat.copyWith(fontSize: 16, fontWeight: FontWeight.w700);

  static TextStyle get tsMontserratT20B =>
      tsMontserrat.copyWith(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle get tsMontserratT32B =>
      tsMontserrat.copyWith(fontSize: 32, fontWeight: FontWeight.bold);
}
