import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class MediumButton extends StatefulWidget {
  final String name;
  final VoidCallback onClick;
  final Color color;
  final IconData icon;

  const MediumButton({
    super.key,
    required this.name,
    required this.onClick,
    required this.icon,
    required this.color,
  });

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
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
        width: 243,
        height: 54,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
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
              width: 120,
              alignment: Alignment.center,
              child: Text(
                widget.name,
                style: TextStyles.normalTextBold.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(width: 9),

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
