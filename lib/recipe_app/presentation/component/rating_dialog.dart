import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final void Function(int) onChange;

  const RatingDialog({super.key, required this.onChange});

  @override
  _RatingDialogState createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int _stars = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text('Rate recipe', style: TextStyles.rateRecipeText),
      ),
      content: StatefulBuilder(
        builder:
            (context, setStateDialog) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      5,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _stars = index + 1;
                          });
                          setStateDialog(() {});
                        },
                        child: Icon(
                          index + 1 <= _stars ? Icons.star : Icons.star_border,
                          color: ColorStyles.rating,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed:
                          _stars == 0
                              ? null
                              : () {
                                widget.onChange(_stars);
                                Navigator.of(context).pop();
                              },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _stars == 0
                                ? ColorStyles.containerColor
                                : ColorStyles.rating,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50.0,
                          vertical: 10.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        'Send',
                        style: TextStyles.rateText.copyWith(
                          color: Colors.white,
                          fontSize: 18,
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
