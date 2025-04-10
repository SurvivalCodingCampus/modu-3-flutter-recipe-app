import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

import '../../../ui/text.dart';

Widget _buildButton({
  required Size size,
  required EdgeInsets padding,
  required VoidCallback onPressed,
  bool showIcon = true,
}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorStyles.primary100,
          minimumSize: size,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: padding,
            child: Text(
              'Button',
              style: TextStyles.normalTextBold.copyWith(
                color: ColorStyles.white,
              ),
            ),
          ),
          if (showIcon) Icon(Icons.arrow_forward, color: ColorStyles.white)
        ],
      ),
    ),
  );
}

class ButtonsWidget extends StatelessWidget {
  final VoidCallback onClick;


  const ButtonsWidget({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildButton(
          size: const Size(315, 60),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          onPressed: onClick,
        ),
        _buildButton(
          size: const Size(243, 54),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          onPressed: onClick,
        ),
        _buildButton(
          size: const Size(174, 37),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          onPressed: onClick,
          showIcon: false,
        ),
      ],
    );
  }
}

