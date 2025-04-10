import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';

enum ButtonType { standard, hover, disabled }

Color getSendButtonColor(ButtonType type) {
  switch (type) {
    case ButtonType.standard:
      return ColorStyle.rating;
    case ButtonType.hover:
      return ColorStyle.secondary20;
    case ButtonType.disabled:
      return ColorStyle.gray4;
  }
}
