import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../ui/text_styles.dart';

class FInputField extends StatelessWidget {
  final String label;
  final String placeHolder;
  final String value;
  final void Function(String) onValueChange;

  const FInputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.value,
    required this.onValueChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315,
      height: 81,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 5,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(label, style: TextStyles.smallTextRegular(color: AppColors.black),),
          ),

          Container(
            width: 315,
            height: 55,
            alignment: Alignment.centerLeft,
            child: TextField(
              decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle: TextStyles.smallerTextRegular(color: AppColors.gray4),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.gray4, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: AppColors.primary80, width: 1.5),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
              style: TextStyles.smallerTextRegular(color: AppColors.black),
            )
            // Container(
            //   child: Text(placeHolder, style: TextStyles.smallerTextRegular(color: AppColors.gray4),),
            // ),
          )
        ],
      ),
    );
  }
}
