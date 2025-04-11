
import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

import '../../../ui/text.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Buttons(onClick: () {  },),
      ),
    )
  );
}


class Buttons extends StatefulWidget {
  final VoidCallback onClick;

  const Buttons({super.key, required this.onClick});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {

  bool clickedButton = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(

          onTapUp: (_) {
            setState(() {
              clickedButton = true;
            });
            widget.onClick();
          },
          onTapCancel: () {
            setState(() {
              clickedButton = false;
            });
          },
          onTapDown: (_) {
            setState(() {
              clickedButton = false;
            });
          },

          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: clickedButton? ColorStyles.primary100 : ColorStyles.gray4,
            ),
            child: Center(
              child: Text('Button',
                style: TextStyles.normalTextBold.copyWith(
                  color: ColorStyles.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
