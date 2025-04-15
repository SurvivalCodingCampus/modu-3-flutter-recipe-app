
import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

import '../../../ui/text.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Buttons(onClick: () {  },buttonName: 'exit',),
      ),
    )
  );
}


class Buttons extends StatefulWidget {
  final VoidCallback onClick;
  final String buttonName;

  const Buttons({super.key, required this.onClick, required this.buttonName});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool clickedButton = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            widget.onClick();
          },
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
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: clickedButton ? ColorStyles.primary100 : ColorStyles.primary60,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.0),
                  child: Text(widget.buttonName,
                    style: TextStyles.normalTextBold.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
