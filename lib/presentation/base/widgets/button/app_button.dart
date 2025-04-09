import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/buttom_enum.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class AppButton extends StatelessWidget {
  // Todo
  // TextStyle 설정
  // --- text style ---
  final ButtonType type;
  // --- --- --- --- ---
  final String text;
  final VoidCallback? onClick;
  final double horizontalMargin;
  // size
  final double? width;
  final double? height;

  const AppButton({
    required this.text,
    this.type = ButtonType.big,
    // --- --- --- --- ---
    this.horizontalMargin = 0,
    // size
    this.width,
    this.height,
    required this.onClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onClick,
      child: Container(
        width: width ?? _width(),
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        padding: EdgeInsets.symmetric(vertical: _verticalPadding()),
        decoration: BoxDecoration(
          color: AppColor.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: _child(),
      ),
    );
  }

  double _verticalPadding() {
    switch (type) {
      case ButtonType.big:
        return 18;
      case ButtonType.medium:
        return 15;
      case ButtonType.small:
        return 10;
    }
  }

  double _width() {
    switch (type) {
      case ButtonType.big:
        return 315;
      case ButtonType.medium:
        return 243;
      case ButtonType.small:
        return 174;
    }
  }

  TextStyle _textStyle() {
    switch (type) {
      case ButtonType.big || ButtonType.medium:
        return AppTextstyle.normalBold;
      case ButtonType.small:
        return AppTextstyle.smallBold;
    }
  }

  Widget _child() {
    switch (type) {
      case ButtonType.big || ButtonType.medium:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: _textStyle().copyWith(color: AppColor.white)),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Icon(Icons.arrow_forward, color: AppColor.white),
            ),
          ],
        );
      case ButtonType.small:
        return Center(
          child: Text(
            text,
            style: _textStyle().copyWith(color: AppColor.white),
          ),
        );
    }
  }
}
