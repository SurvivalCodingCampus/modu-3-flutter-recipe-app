import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/domain/model/procedure.dart';

class ProcedureItem extends StatelessWidget {
  final Procedure procedure;
  const ProcedureItem({super.key, required this.procedure});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorStyles.gray4,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Step ${procedure.step}',
                style: TextStyles.smallBold(),
              ),
              Text(
                'Step ${procedure.content}',
                style: TextStyles.smallRegular(color: ColorStyles.gray3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
