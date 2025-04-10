import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';

import '../component/color_text_button.dart';

class ButtonPage extends StatelessWidget {
  ButtonPage({super.key});

  final List<Map<String, dynamic>> buttonColor = [
    {'buttonColor': ColorStyle.primary100, 'textColor': ColorStyle.white},
    {
      'buttonColor': ColorStyle.primary100.withValues(alpha: 0.8),
      'textColor': ColorStyle.white,
    },
    {'buttonColor': ColorStyle.gray4, 'textColor': ColorStyle.white},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children:
              buttonColor.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    top: 10,
                    left: 30,
                    right: 30,
                  ),
                  child: ColorTextButton(
                    buttonHeight: 60,
                    buttonWidth: MediaQuery.of(context).size.width,
                    buttonText: "Button",
                    buttonColor: e["buttonColor"],
                    textColor: ColorStyle.white,
                    onPreesed: () {},
                    buttonRadius: 10,
                  ),
                );
              }).toList(),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          children:
              buttonColor.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    top: 10,
                    left: 30,
                    right: 30,
                  ),
                  child: ColorTextButton(
                    buttonHeight: 54,
                    buttonWidth: MediaQuery.of(context).size.width / 2,
                    buttonText: "Button",
                    buttonColor: e["buttonColor"],
                    textColor: ColorStyle.white,
                    onPreesed: () {},
                    buttonRadius: 10,
                  ),
                );
              }).toList(),
        ),
        Column(
          children:
              buttonColor.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: ColorTextButton(
                    buttonHeight: 37,
                    buttonWidth: MediaQuery.of(context).size.width / 3,
                    buttonText: "Button",
                    buttonColor: e["buttonColor"],
                    textColor: ColorStyle.white,
                    onPreesed: () {},
                    buttonRadius: 10,
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
