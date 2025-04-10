import 'package:flutter/material.dart';

import '../../ui/button_styles.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class MediumButton extends StatefulWidget {
  final VoidCallback onClick;

  const MediumButton({super.key, required this.onClick});

  @override
  State<MediumButton> createState() => _MediumButtonState();
}

class _MediumButtonState extends State<MediumButton> {
  void callOnClick() {
    widget.onClick.call();
  }

  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          _enabled = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          _enabled = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _enabled = true;
        });
      },
      child: ElevatedButton(
        onPressed: callOnClick,
        style:
            _enabled ? ButtonStyles.elevatedButton : ButtonStyles.disableButton,
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
      ),
    );
  }
}
