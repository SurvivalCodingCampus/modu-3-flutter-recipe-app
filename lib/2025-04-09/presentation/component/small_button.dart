import 'package:flutter/material.dart';

import '../../ui/button_styles.dart';
import '../../ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onClick;

  const SmallButton({super.key, required this.onClick});

  void callOnClick() {
    onClick.call();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callOnClick,
      style: ButtonStyles.elevatedButton,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        width: 174,
        height: 37,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('Button', style: TextStyles.smallButtonText)],
        ),
      ),
    );
  }
}
