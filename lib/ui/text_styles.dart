import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  // Bold styles
  static final titleBold = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 50,
    height: 71 / 50,
  );

  static final headerBold = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    height: 45 / 30,
  );

  static final largeBold = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 30 / 20,
  );

  static final mediumBold = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    height: 27 / 18,
  );

  static final normalBold = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 24 / 16,
  );

  static final smallBold = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    height: 21 / 14,
  );

  static final extraSmallBold = GoogleFonts.poppins(
    fontWeight: FontWeight.bold,
    fontSize: 11,
    height: 17 / 11,
  );

  // Regular styles
  static final titleRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 50,
    height: 75 / 50,
  );

  static final headerRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 30,
    height: 45 / 30,
  );

  static final largeRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 30 / 20,
  );

  static final mediumRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 27 / 18,
  );

  static final normalRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
  );

  static final smallRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 21 / 14,
  );

  static final extraSmallRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    height: 27 / 11,
  );
}