import 'package:flutter/material.dart';
import 'package:recipe_app/ui/text_style.dart';
import 'package:recipe_app/ui/color_style.dart';

class SmallButton extends StatefulWidget {
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
  State<SmallButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<SmallButton> {
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
        width: 174,
        height: 37,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
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
          ],
        ),
      ),
    );
  }
}
