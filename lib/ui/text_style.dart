import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static final TextStyle titleTextBold = GoogleFonts.poppins(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    height: 75 / 50,
  );
  static final TextStyle headerTextBold = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    height: 45 / 30,
  );
  static final TextStyle largeTextBold = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 30 / 20,
  );
  static final TextStyle mediumTextBold = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 27 / 18,
  );
  static final TextStyle normalTextBold = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
  );
  static final TextStyle smallTextBold = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 21 / 14,
  );
  static final TextStyle smallerTextBold = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    height: 17 / 11,
  );

  static final TextStyle titleTextRegular = GoogleFonts.poppins(
    fontSize: 50,
    height: 75 / 50,
  );
  static final TextStyle headerTextRegular = GoogleFonts.poppins(
    fontSize: 30,
    height: 45 / 30,
  );
  static final TextStyle largeTextRegular = GoogleFonts.poppins(
    fontSize: 20,
    height: 30 / 20,
  );
  static final TextStyle mediumTextRegular = GoogleFonts.poppins(
    fontSize: 18,
    height: 27 / 18,
  );
  static final TextStyle normalTextRegular = GoogleFonts.poppins(
    fontSize: 16,
    height: 24 / 16,
  );
  static final TextStyle smallTextRegular = GoogleFonts.poppins(
    fontSize: 14,
    height: 21 / 14,
  );
  static final TextStyle smallerTextRegular = GoogleFonts.poppins(
    fontSize: 11,
    height: 17 / 11,
  );
}
