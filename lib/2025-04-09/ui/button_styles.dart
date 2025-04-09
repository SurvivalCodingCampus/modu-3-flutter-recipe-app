import 'package:flutter/material.dart';

import 'color_styles.dart';

abstract class ButtonStyles {
  static final ButtonStyle elevatedButton = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    backgroundColor: ColorStyles.buttonColor,
  );
}
