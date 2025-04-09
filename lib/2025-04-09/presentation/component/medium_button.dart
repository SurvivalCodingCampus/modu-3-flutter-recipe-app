import 'package:flutter/material.dart';

import '../../ui/button_styles.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class MediumButton extends StatelessWidget {
  final VoidCallback onClick;

  const MediumButton({super.key, required this.onClick});

  void callOnClick() {
    onClick.call();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callOnClick,
      style: ButtonStyles.elevatedButton,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        width: 243,
        height: 54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Button', style: TextStyles.buttonText),
            Icon(Icons.arrow_forward_outlined, color: ColorStyles.iconColor),
          ],
        ),
      ),
    );
  }
}
