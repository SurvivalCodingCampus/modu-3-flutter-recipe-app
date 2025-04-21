import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';

class FilterButton extends StatelessWidget {
  final List<String> text;
  final bool isSelected;
  final ValueChanged<List<String>>? onSelected;

  const FilterButton({
    super.key,
    required this.text,
    this.onSelected,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      runSpacing: 6,
      children: List.generate(text.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              if (onSelected != null) {
                onSelected!(<String>[text[index]]);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: ColorStyles.primary100, width: 1),
                color: isSelected ? ColorStyles.primary100 : ColorStyles.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                text[index],
                style: TextStyles.smallerRegular.copyWith(
                  color: isSelected ? ColorStyles.white : ColorStyles.primary80,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
