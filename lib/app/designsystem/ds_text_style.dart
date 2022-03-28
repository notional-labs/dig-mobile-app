import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DSTextStyle {
  static TextStyle get tsMontserrat => GoogleFonts.montserrat();

  static TextStyle get tsMontserratT10R =>
      GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.normal);

  static TextStyle get tsMontserratT12R =>
      GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.normal);

  static TextStyle get tsMontserratT16M =>
      GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle get tsMontserratT20B =>
      GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle get tsMontserratT32B =>
      GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.bold);
}
