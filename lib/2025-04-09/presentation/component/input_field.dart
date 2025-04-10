import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-09/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final void Function(String) onValueChange;

  const InputField({super.key, required this.onValueChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Label', style: TextStyles.labelText),
        SizedBox(
          width: 315,
          height: 55,
          child: TextField(
            onChanged: onValueChange,
            decoration: InputDecoration(
              hintText: 'Placeholder',
              hintStyle: TextStyle(color: ColorStyles.uneabledTextFieldColor),
              contentPadding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: ColorStyles.uneabledTextFieldColor,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: ColorStyles.uneabledTextFieldColor,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: ColorStyles.textFieldColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
