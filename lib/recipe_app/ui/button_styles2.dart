import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/color_styles2.dart';

abstract class ButtonStyles2 {
  static final ButtonStyle unSelectedButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: ColorStyles2.primary80),
    ),
  );
  static final ButtonStyle selectedButton = ElevatedButton.styleFrom(
    backgroundColor: ColorStyles2.primary100,
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: ColorStyles2.primary100),
    ),
  );

  static final ButtonStyle splashScreenButton = ElevatedButton.styleFrom(
    backgroundColor: ColorStyles2.splashButtonColor,
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      side: BorderSide(color: ColorStyles2.splashButtonColor),
    ),
    minimumSize: Size(243, 54),
  );
}
