import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/buttons.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final String buttonTitle;
  final void Function(int) onChange;

  const RatingDialog({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onChange,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int starCount = 0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: ColorStyle.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x1A000000),
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: const Color(0x33000000),
                      offset: const Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(widget.title, style: AppTextStyles.smallRegular()),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                starCount = index + 1;
                              });
                            },
                            child: Icon(
                              index < starCount
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              size: 30,
                              color: ColorStyle.rating,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 5),
                      Buttons(
                        text: widget.buttonTitle,
                        size: ButtonSize.small,
                        isDisabled: starCount == 0,
                        onPressed: () {
                          if (starCount != 0) {
                            widget.onChange(starCount);
                            Navigator.pop(context); // dialog 닫기
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
