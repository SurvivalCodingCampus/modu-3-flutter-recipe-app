import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';

class CustomInputField extends StatelessWidget {
  final String labelString;
  final FocusNode? focusNode;

  CustomInputField({super.key, required this.labelString, this.focusNode});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(labelString, style: AppTextStyles.smallRegular()),
          TextField(
            autofocus: false,
            focusNode : focusNode,
            controller: textEditingController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorStyle.gray4, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorStyle.primary100,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
