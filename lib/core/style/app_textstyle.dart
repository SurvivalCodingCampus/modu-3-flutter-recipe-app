import 'package:flutter/widgets.dart';

abstract class AppTextstyle {
  // base
  static TextStyle baseTextStyle(
    double size,
    FontWeight fontWeight, {
    double? height,
  }) => TextStyle(
    fontSize: size,
    fontWeight: fontWeight,
    height: height,
    fontFamily: 'Poppins',
  );

  // w700 => bold
  // w400 => regular
  static TextStyle boldStyle(double size, {double? height}) =>
      baseTextStyle(size, FontWeight.w700, height: height);

  static TextStyle regularStyle(double size, {double? height}) =>
      baseTextStyle(size, FontWeight.w400, height: height);

  // bold
  static TextStyle titleBold = boldStyle(50);
  static TextStyle headerBold = boldStyle(30);
  static TextStyle largeBold = boldStyle(20);
  static TextStyle mediumBold = boldStyle(18);
  static TextStyle normalBold = boldStyle(16);
  static TextStyle smallBold = boldStyle(14);
  static TextStyle smallerBold = boldStyle(11);

  // regular
  static TextStyle titleRegular = regularStyle(50);
  static TextStyle headerRegular = boldStyle(30);
  static TextStyle largeRegular = regularStyle(20);
  static TextStyle mediumRegular = regularStyle(18);
  static TextStyle normalRegular = regularStyle(16);
  static TextStyle smallRegular = regularStyle(14);
  static TextStyle smallerRegular = regularStyle(11);
}
