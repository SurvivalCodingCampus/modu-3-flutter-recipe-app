import 'package:flutter/material.dart';

const String kFontFamily = 'Poppins';

abstract class TextStyles {
  // Bold
  static const TextStyle titleBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 50,
    height: 1.5,
  );

  static const TextStyle headerBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    height: 1.5,
  );

  static const TextStyle largeBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    height: 1.5,
  );

  static const TextStyle mediumBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    height: 1.5,
  );

  static const TextStyle normalBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    height: 1.5,
  );

  static const TextStyle smallBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    height: 1.5,
  );

  static const TextStyle smallerBold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 11,
    height: 1.5,
  );

  // Regular
  static const TextStyle titleRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 50,
    height: 1.5,
  );

  static const TextStyle headerRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 30,
    height: 1.5,
  );

  static const TextStyle largeRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 20,
    height: 1.5,
  );

  static const TextStyle mediumRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 18,
    height: 1.5,
  );

  static const TextStyle normalRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16,
    height: 1.5,
  );

  static const TextStyle smallRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    height: 1.5,
  );

  static const TextStyle smallerRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 11,
    height: 1.5,
  );
}
