import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_styles.dart';

abstract class TextStyles {
  static TextStyle amountText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorStyles.gray3,
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
    color: ColorStyles.chefName,
  );
  static TextStyle cookingTimeText = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ColorStyles.minuteColor,
  );
  static TextStyle starRateText = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: ColorStyles.primary80,
  );
  static TextStyle rateRecipeText = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorStyles.titleBlackColor,
  );
  static TextStyle savedRecipesText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorStyles.titleBlackColor,
  );
  static TextStyle splashScreenText = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // SmallText 기반
  static TextStyle smallTextRegular = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorStyles.titleBlackColor,
  );
  static TextStyle smallerTextRegular = GoogleFonts.poppins(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ColorStyles.gray4,
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

  //normal Text 기반
  static TextStyle normalText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: ColorStyles.titleBlackColor,
  );
  static TextStyle normalTextBold = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  //large Text 기반
  static TextStyle largeTextRegular = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: ColorStyles.titleBlackColor,
  );
  static TextStyle largeTextBold = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle headerTextBold = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
