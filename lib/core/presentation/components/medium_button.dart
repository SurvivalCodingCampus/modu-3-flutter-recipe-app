import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const MediumButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243,
      height: 54,
      decoration: BoxDecoration(
        color: ColorStyle.primary100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 114,
            child: Text(
              text,
              style: AppTextStyles.normalBold.copyWith(color: ColorStyle.white),
            ),
          ),
          const SizedBox(width: 11),
          Icon(Icons.arrow_forward, weight: 20, color: ColorStyle.white),
        ],
      ),
    );
  }
}
