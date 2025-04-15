import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'button_widget.dart';

class RatingDialog extends StatefulWidget {
  final void Function(int rateValue) onChange;
  final String title;
  final String actionName;

  const RatingDialog({
    super.key,
    required this.onChange,
    required this.title,
    required this.actionName,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int selectedRate = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.title, style: TextStyles.smallRegular()),
        SizedBox(height: 10),
        Row(
          children: List.generate(5, (index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRate = index + 1;
                    });
                  },
                  child: index < selectedRate
                      ? Icon(Icons.star, size: 20, color: ColorStyles.rating)
                      : Icon(Icons.star_border, size: 20, color: ColorStyles.rating),
                )
            );
          }),
        ),
        SizedBox(height: 10),
        _RatingDialogButton(
          selectedRate: selectedRate,
          buttonText: widget.actionName,
          onClick: () {
            widget.onChange(selectedRate);
            },
        )
      ],
    );
  }
}

class _RatingDialogButton extends StatelessWidget {
  final void Function() onClick;
  final int selectedRate;
  final String buttonText;

  const _RatingDialogButton({
    required this.onClick,
    required this.selectedRate,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(selectedRate >= 1) {
          onClick();
        }
      },
      child: Container(
        width: ButtonSize.small.width,
        height: ButtonSize.small.height,
        decoration: BoxDecoration(
          color: selectedRate < 1
              ? ColorStyles.gray4
              : ColorStyles.rating,
          borderRadius: BorderRadius.circular(ButtonSize.small.border),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyles.smallerRegular(color: ColorStyles.white),
          ),
        ),
      ),
    );
  }
}
