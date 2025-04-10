import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class RatingDialogAlert extends StatefulWidget {
  final String title;
  final String actionName;
  final void Function(int) onChange;
  const RatingDialogAlert({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
  });

  @override
  State<RatingDialogAlert> createState() => _RatingDialogAlertState();
}

class _RatingDialogAlertState extends State<RatingDialogAlert> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStyles.white,
      title: Center(
        child: Text(widget.title, style: TextStyles.smallTextRegular),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i < 6; i++) ...[
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = i;
                });
              },
              child: Icon(
                selectedIndex >= i ? Icons.star : Icons.star_border,
                color: ColorStyles.rating,
                size: 20,
              ),
            ),
            if (i != 5) SizedBox(width: 10),
          ],
        ],
      ),
      actions: [
        Center(
          child: GestureDetector(
            onTap: () {
              widget.onChange(selectedIndex);
              Navigator.of(context).pop();
            },
            child: Container(
              height: 20,
              width: 61,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorStyles.rating,
              ),
              child: Center(
                child: Text(
                  widget.actionName,
                  style: TextStyles.smallTextRegular.copyWith(
                    color: ColorStyles.white,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
