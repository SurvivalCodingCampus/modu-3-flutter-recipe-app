import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/button/enum/button_type.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const SmallButton({super.key, required this.text, required this.onTap});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
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
        width: 174,
        decoration: BoxDecoration(
          color:
              buttonType == ButtonType.standard
                  ? ColorStyle.primary100
                  : ColorStyle.gray4,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 114,
                child: Text(
                  widget.text,
                  style: TextFontStyle.smallBold(color: ColorStyle.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
