import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class RatingButton extends StatelessWidget {
  final int rate;
  final int selectedItem;
  final ValueChanged<List<int>>? onSelected;

  const RatingButton({
    super.key,
    required this.rate,
    required this.selectedItem,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(rate, (index) {
        final isSelected = index < selectedItem;

        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                if (onSelected != null) {
                  onSelected!([index + 1]);
                }
              },
              child: Container(
                height: 28,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorStyles.primary100, width: 1),
                  color:
                      isSelected ? ColorStyles.primary100 : ColorStyles.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${index + 1}',
                      style: TextStyles.smallerRegular.copyWith(
                        color:
                            isSelected
                                ? ColorStyles.white
                                : ColorStyles.primary80,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.star,
                      size: 16,
                      color:
                          isSelected
                              ? ColorStyles.white
                              : ColorStyles.primary80,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
