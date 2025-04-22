import 'package:flutter/material.dart';

import '../ui/color_styles.dart';
import '../ui/text_styles.dart';


class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 50,
          maxWidth: double.infinity,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? ColorStyles.primary80 : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: ColorStyles.primary80),
          ),
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.smallerTextRegular.copyWith(
              color: isSelected ? Colors.white : ColorStyles.primary80,
            ),
          ),
        ),
      ),
    );
  }
}

class RateButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const RateButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 28,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? ColorStyles.primary80 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: ColorStyles.primary80),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyles.smallerTextRegular.copyWith(
                color: isSelected ? Colors.white : ColorStyles.primary80,
              ),
            ),
            Spacer(),
            Icon(
              Icons.star,
              color: isSelected ? Colors.white : ColorStyles.primary80,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
