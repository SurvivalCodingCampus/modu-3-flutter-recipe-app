import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

class BoxIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const BoxIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: Icon(icon, color: ColorStyles.white, size: 20)),
      ),
    );
  }
}
