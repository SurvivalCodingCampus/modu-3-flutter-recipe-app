import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/button/enum/button_type.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class Rating extends StatefulWidget {
  final String title;
  final String actionName;

  final void Function(int index) onChange;
  const Rating({
    super.key,
    required this.title,
    required this.actionName,
    required this.onChange,
  });

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  int starIndex = 0;
  ButtonType currentType = ButtonType.standard;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 10,
      backgroundColor: ColorStyle.white,
      content: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title, style: TextFontStyle.smallRegular()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: List.generate(5, (index) {
                  final isSelected = index < starIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (starIndex == index + 1) {
                          starIndex = 0;
                        } else {
                          starIndex = index + 1;
                        }
                      });
                    },
                    child: TweenAnimationBuilder(
                      tween: Tween(begin: 1.0, end: isSelected ? 1.2 : 1.0),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child:
                              isSelected
                                  ? const Icon(
                                    Icons.star,
                                    color: ColorStyle.rating,
                                  )
                                  : const Icon(
                                    Icons.star_border,
                                    color: ColorStyle.rating,
                                  ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.onChange(starIndex);
              },
              onTapDown: (details) {
                setState(() {
                  currentType = ButtonType.hover;
                });
              },
              onTapUp: (details) {
                setState(() {
                  currentType = ButtonType.standard;
                });
              },
              onTapCancel: () {
                setState(() {
                  currentType = ButtonType.standard;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: getSendButtonColor(
                    starIndex == 0 ? ButtonType.disabled : currentType,
                  ),
                ),
                child: Text(
                  widget.actionName,
                  style: TextFontStyle.extraSmallRegular(
                    color: ColorStyle.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
