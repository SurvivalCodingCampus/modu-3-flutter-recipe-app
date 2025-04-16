import 'package:flutter/material.dart';

import '../ui/color_styles.dart';
import '../ui/text_styles.dart';


class InputFieldWidget extends StatefulWidget {
  final String label;
  final String placeHolder;
  final String value;
  final Function(String) onValueChange;

  const InputFieldWidget({
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyles.smallTextRegular.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 315,
            height: 81,
            child: TextFormField(
              initialValue: widget.value,
              onChanged: widget.onValueChange,
              style: TextStyles.smallerTextRegular,
              decoration: InputDecoration(
                hintText: widget.placeHolder,
                hintStyle: TextStyles.smallerTextRegular.copyWith(
                  color: ColorStyles.gray4,
                ),
                contentPadding: EdgeInsets.only(left: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorStyles.primary80,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
