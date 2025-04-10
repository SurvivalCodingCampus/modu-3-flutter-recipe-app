import 'package:flutter/material.dart';
import 'package:recipe_app/ui/text_style.dart';

class MediumButton extends StatelessWidget {
  final String name;
  final VoidCallback onClick;
  final IconData icon;
  final Color color;
  const MediumButton({
    super.key,
    required this.name,
    required this.onClick,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 243,
        height: 54,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: TextStyles.normalTextBold.copyWith(color: Colors.white),
            ),

            Icon(icon, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}
