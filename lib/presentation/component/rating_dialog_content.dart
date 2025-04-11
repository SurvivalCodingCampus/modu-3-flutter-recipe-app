import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class RatingDialogContent extends StatefulWidget {
  final String title;
  final String submitTitle;
  final void Function(int rating) onSubmitted;

  const RatingDialogContent({
    super.key,
    required this.title,
    required this.submitTitle,
    required this.onSubmitted,
  });

  @override
  State<RatingDialogContent> createState() => _RatingDialogContentState();
}

class _RatingDialogContentState extends State<RatingDialogContent> {
  int _selectedRating = 0;

  void _selectRating(int value) {
    setState(() {
      _selectedRating = value;
    });
  }

  void _submit() {
    if (_selectedRating == 0) return;
    //Navigator.of(context).pop();
    widget.onSubmitted(_selectedRating);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.smallRegular(color: ColorStyle.labelColour),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final starIndex = index + 1;
            return IconButton(
              icon: Icon(
                starIndex <= _selectedRating ? Icons.star : Icons.star_border,
                color: ColorStyle.rating,
                size: 30,
              ),
              onPressed: () => _selectRating(starIndex),
            );
          }),
        ),
        const SizedBox(height: 5),

        GestureDetector(
          onTap: () => _submit(),
          child: Container(
            width: 61,
            height: 24,
            padding: const EdgeInsets.symmetric(vertical: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  _selectedRating == 0 ? ColorStyle.gray4 : ColorStyle.rating,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              widget.submitTitle,
              style: AppTextStyles.smallLabel(color: ColorStyle.white),
            ),
          ),
        ),
      ],
    );
  }
}
