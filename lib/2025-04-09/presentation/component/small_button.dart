import 'package:flutter/material.dart';

import '../../ui/button_styles.dart';
import '../../ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final VoidCallback onClick;

  const SmallButton({super.key, required this.onClick});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
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
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          width: 174,
          height: 37,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('Button', style: TextStyles.smallButtonText)],
          ),
        ),
      ),
    );
  }
}
