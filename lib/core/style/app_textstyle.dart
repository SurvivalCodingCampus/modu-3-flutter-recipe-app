import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  // base
  static TextStyle baseTextStyle(
    double size,
    FontWeight fontWeight,
    double height,
  ) => TextStyle(
    fontSize: size,
    fontWeight: fontWeight,
    height: height / size,
    fontFamily: 'Poppins',
  );

  // w700 => bold
  // w400 => regular
  static TextStyle boldStyle(double size, double height) =>
      baseTextStyle(size, FontWeight.w700, height);

  static TextStyle regularStyle(double size, double height) =>
      baseTextStyle(size, FontWeight.w400, height);

  // bold
  static TextStyle titleBold = boldStyle(50, 75);
  static TextStyle headerBold = boldStyle(30, 45);
  static TextStyle largeBold = boldStyle(20, 30);
  static TextStyle mediumBold = boldStyle(18, 27);
  static TextStyle normalBold = boldStyle(16, 24);
  static TextStyle smallBold = boldStyle(14, 21);
  static TextStyle smallerBold = boldStyle(11, 17);

  // regular
  static TextStyle titleRegular = regularStyle(50, 75);
  static TextStyle headerRegular = boldStyle(30, 45);
  static TextStyle largeRegular = regularStyle(20, 30);
  static TextStyle mediumRegular = regularStyle(18, 27);
  static TextStyle normalRegular = regularStyle(16, 24);
  static TextStyle smallRegular = regularStyle(14, 21);
  static TextStyle smallerRegular = regularStyle(11, 17);

  static TextStyle smallLabel = regularStyle(8, 12);
}
