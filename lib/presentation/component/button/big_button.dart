import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/button/enum/button_type.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class BigButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const BigButton({super.key, required this.text, required this.onTap});

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  var buttonType = ButtonType.standard;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) {
        setState(() {
          buttonType = ButtonType.disabled;
        });
      },
      onTapUp: (details) {
        setState(() {
          buttonType = ButtonType.standard;
        });
      },
      onTapCancel: () {
        setState(() {
          buttonType = ButtonType.standard;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color:
              buttonType == ButtonType.standard
                  ? ColorStyle.primary100
                  : ColorStyle.gray4,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 11),
                width: 114,
                child: Text(
                  widget.text,
                  style: TextFontStyle.normalBold(color: ColorStyle.white),
                  textAlign: TextAlign.center,
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: ColorStyle.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
