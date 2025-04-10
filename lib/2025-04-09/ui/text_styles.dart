import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_styles.dart';

abstract class TextStyles {
  static TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorStyles.textColor,
  );
  static TextStyle smallButtonText = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: ColorStyles.textColor,
  );
  static TextStyle labelText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorStyles.labelColor,
  );
  static TextStyle hintText = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ColorStyles.uneabledTextFieldColor,
  );
  static TextStyle selectedLabelText = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: ColorStyles.textColor,
  );
}
