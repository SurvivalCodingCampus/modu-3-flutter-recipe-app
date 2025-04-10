import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class MediumButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MediumButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 243,
        decoration: BoxDecoration(
          color: ColorStyle.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                width: 114,
                child: Text(
                  text,
                  style: TextFontStyle.normalBold(color: ColorStyle.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Icon(Icons.arrow_forward, color: ColorStyle.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
