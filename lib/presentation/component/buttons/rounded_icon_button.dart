import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorStyles.gray4, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(105, 105, 105, 0.1),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 3,
          ),
        ],
      ),
      child: IconButton(icon: Icon(icon), onPressed: onPressed),
    );
  }
}
