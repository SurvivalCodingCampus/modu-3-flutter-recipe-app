import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

abstract class TextStyles {
  static const _fontName = 'Poppins';

  static TextStyle custom({required double fontSize, required FontWeight fontWeight, required Color color, required double height}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: _fontName,
      height: height,
      color: color,
    );
  }

  static TextStyle titleTextRegular({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.normal,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle headerTextRegular({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle largeTextRegular({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle mediumTextRegular({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle normalTextRegular({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle smallTextRegular({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle smallerTextRegular({Color color = AppColors.white, double? fontSize}) {
    return TextStyle(
      fontSize: fontSize ?? 11,
      fontWeight: FontWeight.normal,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle titleTextBold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle headerTextBold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle largeTextBold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle mediumTextBold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle normalTextBold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle smallTextBold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }

  static TextStyle smallerTextBold({Color color = AppColors.white}) {
    return TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      fontFamily: _fontName,
      height: 1.5,
      color: color,
    );
  }
}