import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_styles2.dart';

abstract class TextStyles2 {
  static TextStyle normalText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorStyles2.titleBlackColor,
  );
  static TextStyle normalTextBold = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle amountText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorStyles2.gray3,
  );
  static TextStyle rateText = GoogleFonts.poppins(
    fontSize: 8,
    fontWeight: FontWeight.w400,
  );
  static TextStyle menuIntroduceText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static TextStyle chefNameText = GoogleFonts.poppins(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    color: ColorStyles2.chefName,
  );
  static TextStyle cookingTimeText = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ColorStyles2.minuteColor,
  );
  static TextStyle starRateText = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: ColorStyles2.primary80,
  );
  static TextStyle rateRecipeText = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorStyles2.titleBlackColor,
  );
  static TextStyle savedRecipesText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorStyles2.titleBlackColor,
  );
  static TextStyle splashScreenText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static TextStyle smallerTextRegular = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ColorStyles2.gray4,
  );
  static TextStyle largeTextRegular = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorStyles2.titleBlackColor,
  );
  static TextStyle smallerTextBold = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle smallerTextSemiBold = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle headerTextBold = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle smallTextRegular = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorStyles2.titleBlackColor,
  );
}
