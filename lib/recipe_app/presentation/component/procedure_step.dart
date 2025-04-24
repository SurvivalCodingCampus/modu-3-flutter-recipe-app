import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/model/procedure.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class ProcedureStep extends StatefulWidget {
  final Procedure procedure;

  const ProcedureStep({super.key, required this.procedure});

  @override
  State<ProcedureStep> createState() => _ProcedureStepState();
}

class _ProcedureStepState extends State<ProcedureStep> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorStyles.gray4,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Step ${widget.procedure.step.toString()}',
                  style: TextStyles.smallerTextBold,
                ),
                Text(
                  widget.procedure.content,
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.gray3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
