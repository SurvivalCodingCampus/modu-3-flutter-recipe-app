import 'package:flutter/material.dart';
import 'package:recipe_app/ui/text_style.dart';

class SmallButton extends StatelessWidget {
  final String name;
  final VoidCallback onClick;

  final Color color;
  const SmallButton({
    super.key,
    required this.name,
    required this.onClick,

    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: 174,
        height: 37,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyles.smallerTextBold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
