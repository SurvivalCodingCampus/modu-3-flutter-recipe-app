import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class InputField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String label;
  final String holder;
  final String? value;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.label,
    required this.holder,
    this.value,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(label, style: TextStyles.smallRegular),
        ),
        SizedBox(height: 5),
        Padding(
          padding: EdgeInsets.only(right: 30, left: 30),
          child: SizedBox(
            width: double.infinity,
            height: 80,
            child: TextField(
              style: TextStyles.normalRegular,
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: holder,
                hintStyle: TextStyles.smallerRegular.copyWith(
                  color: ColorStyles.gray4,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorStyles.primary80,
                    width: 1.5,
                  ),
                ),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
