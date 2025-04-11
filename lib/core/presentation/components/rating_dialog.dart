import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final String actionName;
  final void Function(int) onChange;

  const RatingDialog({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStyle.white,
      title: Center(
        child: Text(widget.title, style: AppTextStyles.smallRegular),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(5, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                value = index + 1;
              });
            },
            child: Icon(
              value - 1 >= index ? Icons.star : Icons.star_border_outlined,
              size: 30,
              color: ColorStyle.rating,
            ),
          );
        }),
      ),
      actions: [
        SmallButton(
          text: widget.actionName,
          onClick: () {
            if (value != 0) {
              widget.onChange(value);
            }
          },
          color: value != 0 ? ColorStyle.rating : ColorStyle.gray4,
        ),
      ],
    );
  }
}
