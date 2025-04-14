import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

import '../../ui/text.dart';

class MediumButton extends StatefulWidget {
  final VoidCallback onClick;

  const MediumButton({super.key, required this.onClick});

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
  bool clickedButton = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: Container(
        padding: const EdgeInsets.all(3),
        width: 243,
        height: 54,
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Start Cooking',
                style: TextStyles.normalTextRegular.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
