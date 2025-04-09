import 'package:flutter/cupertino.dart';

import 'color_styles.dart';

abstract class TextStyles {
  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: ColorStyles.textColor,
  );
  static const TextStyle smallButtonText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: ColorStyles.textColor,
  );
  static const TextStyle labelText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: ColorStyles.labelColor,
  );
  static const TextStyle hintText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: ColorStyles.uneabledTextFieldColor,
  );
  static const TextStyle selectedLabelText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: ColorStyles.textColor,
  );
  static const TextStyle unSelectedLabelText = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );
}
