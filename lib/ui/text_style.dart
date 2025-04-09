import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static final TextStyle titleTextBold = GoogleFonts.poppins(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle headerTextBold = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle largeTextBold = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle mediumTextBold = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle normalTextBold = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle smallTextBold = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle smallerTextBold = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle titleTextRegular = GoogleFonts.poppins(fontSize: 50);
  static final TextStyle headerTextRegular = GoogleFonts.poppins(fontSize: 30);
  static final TextStyle largeTextRegular = GoogleFonts.poppins(fontSize: 20);
  static final TextStyle mediumTextRegular = GoogleFonts.poppins(fontSize: 18);
  static final TextStyle normalTextRegular = GoogleFonts.poppins(fontSize: 16);
  static final TextStyle smallTextRegular = GoogleFonts.poppins(fontSize: 14);
  static final TextStyle smallerTextRegular = GoogleFonts.poppins(fontSize: 11);
}
