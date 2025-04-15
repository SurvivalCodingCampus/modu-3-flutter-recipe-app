import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class StyledCheckbox extends StatefulWidget {
  final String text;

  const StyledCheckbox({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => _StyledCheckboxState();
}

class _StyledCheckboxState extends State<StyledCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxTheme(
      data: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        side: WidgetStateBorderSide.resolveWith((states) {
          return const BorderSide(color: ColorStyles.secondary100, width: 1.0);
        }),
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          return ColorStyles.white;
        }),
        checkColor: WidgetStateProperty.all<Color>(ColorStyles.secondary100),
        splashRadius: 0.0,
        overlayColor: WidgetStateProperty.all<Color>(Colors.transparent),
      ),
      child: CheckboxMenuButton(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
        child: Text(
          widget.text,
          style: TextStyles.smallTextRegular.copyWith(
            color: ColorStyles.secondary100,
          ),
        ),
      ),
    );
  }
}
