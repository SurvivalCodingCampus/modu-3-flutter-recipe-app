// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/ui/ui.dart';

class RatingDialog extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;
  const RatingDialog({super.key, required this.title, this.onTap});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent, // Material 배경 투명
        type: MaterialType.transparency, // 타입을 투명으로 설정
        child: Container(
          width: 170,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: ColorStyles.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.title, style: TextStyles.smallerTextRegular),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index + 1;
                      });
                    },

                    child:
                        selectedIndex <= index
                            ? Image.asset(
                              'assets/icons/rating_empty_star.png',
                              width: 20,
                              height: 20,
                            )
                            : Image.asset(
                              'assets/icons/rating_full_star.png',
                              width: 20,
                              height: 20,
                            ),
                  );
                }),
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color:
                            selectedIndex > 0
                                ? ColorStyles.rating
                                : ColorStyles.gray4,
                      ),
                      child: Center(
                        child: Text(
                          'Send',
                          style: TextStyles.smallTextSmallLabel.copyWith(
                            color: ColorStyles.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
