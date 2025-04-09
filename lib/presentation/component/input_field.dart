import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String label;
  final String holder;
  final String? value;

  const InputField({
    super.key,
    required this.label,
    required this.holder,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.normalRegular),
        SizedBox(height: 10),
        SizedBox(
          width: 315,
          height: 80,
          child: TextField(
            style: TextStyles.normalRegular,
            controller: TextEditingController(text: value),
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: holder,
              hintStyle: TextStyles.smallerRegular.copyWith(
                color: ColorStyles.gray4,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorStyles.primary80,
                  width: 1.5,
                ),
              ),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),
      ],
    );
  }
}
