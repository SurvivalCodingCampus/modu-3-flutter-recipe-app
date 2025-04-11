import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class BigButton extends StatefulWidget {
  final String name;
  final VoidCallback onClick;
  final Color color;
  final IconData icon;

  const BigButton({
    super.key,
    required this.name,
    required this.onClick,
    required this.icon,
    required this.color,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  final Duration animaitionDuration = Duration(milliseconds: 100);

  bool isTapDown = false;

  void onButtonTapDown() {
    setState(() {
      isTapDown = true;
    });
  }

  void onButtonTapUp() {
    setState(() {
      isTapDown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      onTapDown: (details) => onButtonTapDown(),
      onTapUp: (details) => onButtonTapUp(),
      onTapCancel: onButtonTapUp,
      child: AnimatedContainer(
        duration: animaitionDuration,
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 85),
        decoration: BoxDecoration(
          color: isTapDown ? ColorStyles.gray4 : widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              height: 24,
              width: 114,
              alignment: Alignment.center,
              child: Text(
                widget.name,
                style: TextStyles.normalTextBold.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(width: 11),

            Container(
              height: 20,
              width: 20,
              alignment: Alignment.center,
              child: Icon(widget.icon, color: Colors.white, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
