import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-10/ui/color_styles2.dart';

abstract class ButtonStyles2 {
  static final ButtonStyle unSelectedButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: ColorStyles2.rateButtonColor),
    ),
  );
  static final ButtonStyle selectedButton = ElevatedButton.styleFrom(
    backgroundColor: ColorStyles2.rateButtonColor,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: ColorStyles2.rateButtonColor),
    ),
  );
}
