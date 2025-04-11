import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/buttom_enum.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class AppButton extends StatefulWidget {
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
  final Color? bgColor;

  const AppButton({
    required this.text,
    this.type = ButtonType.big,
    // --- --- --- --- ---
    this.horizontalMargin = 0,
    // size
    this.width,
    this.height,
    required this.onClick,
    this.bgColor,
    super.key,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool isDisable = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (details) {
        setState(() {
          isDisable = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isDisable = false;
        });
      },
      onTap: widget.onClick,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: widget.width ?? _width(),
        margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        padding: EdgeInsets.symmetric(vertical: _verticalPadding()),
        decoration: BoxDecoration(
          color: bgColor(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _child(),
      ),
    );
  }

  double _verticalPadding() {
    switch (widget.type) {
      case ButtonType.big:
        return 18;
      case ButtonType.medium:
        return 15;
      case ButtonType.small:
        return 10;
    }
  }

  double _width() {
    switch (widget.type) {
      case ButtonType.big:
        return double.infinity;
      case ButtonType.medium:
        return 243;
      case ButtonType.small:
        return 174;
    }
  }

  TextStyle _textStyle() {
    switch (widget.type) {
      case ButtonType.big || ButtonType.medium:
        return AppTextStyle.normalBold;
      case ButtonType.small:
        return AppTextStyle.smallBold;
    }
  }

  Widget _child() {
    switch (widget.type) {
      case ButtonType.big || ButtonType.medium:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: _textStyle().copyWith(color: AppColor.white),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Icon(Icons.arrow_forward, color: AppColor.white),
            ),
          ],
        );
      case ButtonType.small:
        return Center(
          child: Text(
            widget.text,
            style: _textStyle().copyWith(color: AppColor.white),
          ),
        );
    }
  }

  Color bgColor() {
    if (isDisable || widget.onClick == null) {
      return AppColor.grey4;
    }
    if (widget.bgColor != null) {
      return widget.bgColor!;
    }
    return AppColor.primary100;
  }
}
