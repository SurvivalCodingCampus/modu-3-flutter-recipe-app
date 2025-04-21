import 'package:flutter/material.dart';
import '../../ui/color_styles.dart';

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
        final starIndex = index + 1;
        final isSelected = selectedItem >= starIndex;

        return Expanded(
          child: GestureDetector(
            onTap: () => onSelected?.call([starIndex]),
            child: Container(
              height: 28,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected ? ColorStyles.primary100 : ColorStyles.white,
                border: Border.all(color: ColorStyles.primary100, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$starIndex',
                    style: TextStyle(
                      color: isSelected ? Colors.white : ColorStyles.primary80,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.star,
                    size: 16,
                    color: isSelected ? Colors.white : ColorStyles.primary80,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
