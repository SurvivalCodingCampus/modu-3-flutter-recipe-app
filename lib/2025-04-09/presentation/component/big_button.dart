import 'package:flutter/material.dart';

import '../../ui/button_styles.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class BigButton extends StatefulWidget {
  final VoidCallback onClick;

  const BigButton({super.key, required this.onClick});

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  void callOnClick() {
    widget.onClick.call();
  }

  bool _enable = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _enable = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          _enable = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _enable = true;
        });
      },
      child: ElevatedButton(
        onPressed:
            _enable
                ? () {
                  callOnClick();
                }
                : null,
        style:
            _enable ? ButtonStyles.elevatedButton : ButtonStyles.disableButton,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 85),
          width: 310,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Button', style: TextStyles.buttonText),
              Icon(Icons.arrow_forward_outlined, color: ColorStyles.iconColor),
            ],
          ),
        ),
      ),
    );
  }
}
