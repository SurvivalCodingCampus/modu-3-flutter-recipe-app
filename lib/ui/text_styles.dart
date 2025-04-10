import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/ui/color_styles.dart';

abstract class AppTextStyles {
  // ─── Bold ─────────────────────────────
  static TextStyle titleBold({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 50,
    height: 71 / 50,
    color: color ?? ColorStyle.black,
  );

  static TextStyle headerBold({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    height: 45 / 30,
    color: color ?? ColorStyle.black,
  );

  static TextStyle largeBold({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 30 / 20,
    color: color ?? ColorStyle.black,
  );

  static TextStyle mediumBold({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    height: 27 / 18,
    color: color ?? ColorStyle.black,
  );

  static TextStyle normalBold({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 24 / 16,
    color: color ?? ColorStyle.black,
  );

  static TextStyle smallBold({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    height: 21 / 14,
    color: color ?? ColorStyle.black,
  );

  static TextStyle extraSmallBold({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 11,
    height: 17 / 11,
    color: color ?? ColorStyle.black,
  );

  // ─── Regular ─────────────────────────
  static TextStyle titleRegular({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 50,
    height: 75 / 50,
    color: color ?? ColorStyle.black,
  );

  static TextStyle headerRegular({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 30,
    height: 45 / 30,
    color: color ?? ColorStyle.black,
  );

  static TextStyle largeRegular({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 30 / 20,
    color: color ?? ColorStyle.black,
  );

  static TextStyle mediumRegular({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 27 / 18,
    color: color ?? ColorStyle.black,
  );

  static TextStyle normalRegular({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
    color: color ?? ColorStyle.black,
  );

  static TextStyle smallRegular({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 21 / 14,
    color: color ?? ColorStyle.black,
  );

  static TextStyle extraSmallRegular({Color? color}) => GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 27 / 11,
    color: color ?? ColorStyle.black,
  );
}
