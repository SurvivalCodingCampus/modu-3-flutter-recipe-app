import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class InputFieldWidget extends StatelessWidget {
  final void Function(String value) onValueChange;
  final String label;
  final String placeHolder;
  final String value;

  const InputFieldWidget({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: value);
    return Container(
      width: 315,
      height: 81,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 21,
                child: Text(
                  label,
                  style: TextStyles.smallRegular(color: ColorStyles.labelColor),
                ),
              ),
            ],
          ),
          Container(
            width: 315,
            height: 55,
            child: TextField(
              controller: controller,
              onChanged: (text) {
                onValueChange(controller.text);
              },
              decoration: InputDecoration(
                hintText: placeHolder,
                enabledBorder: OutlineInputBorder(
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
