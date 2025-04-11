import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        type: MaterialType.transparency,
        child: Container(
          // height: 91,
          width: 170,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: ColorStyles.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black12)],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title, style: TextStyles.smallTextRegular),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i < 6; i++) ...[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = (i);
                        });
                      },
                      child: Icon(
                        selectedIndex >= i ? Icons.star : Icons.star_border,
                        color: ColorStyles.rating,
                        size: 20,
                      ),
                    ),
                    if (i != 5) const SizedBox(width: 10),
                  ],
                ],
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  if (selectedIndex != 0) {
                    widget.onChange(selectedIndex);
                  }
                },
                child: Container(
                  height: 20,
                  width: 61,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color:
                        selectedIndex == 0
                            ? ColorStyles.gray4
                            : ColorStyles.rating,
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
            ],
          ),
        ),
      ),
    );
  }
}
