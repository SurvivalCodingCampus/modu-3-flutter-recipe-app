import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/procedure.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class StepItem extends StatelessWidget {
  final Procedure procedure;
  const StepItem({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyle.gray4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Step ${procedure.step}', style: AppTextStyles.smallBold),
          Text(
            procedure.content,
            style: AppTextStyles.smallRegular.copyWith(color: ColorStyle.gray3),
          ),
        ],
      ),
    );
  }
}
