import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final String actionName;
  final void Function(int) onChange;
  final VoidCallback onButtonTap;
  const RatingDialog({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
    required this.onButtonTap,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      width: 170,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Column(
        children: [
          Text(widget.title, style: TextStyles.smallTextRegular),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 1; i < 6; i++) ...[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = (i);
                    });
                    widget.onChange(i);
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
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              widget.onButtonTap();
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
        ],
      ),
    );
  }
}
