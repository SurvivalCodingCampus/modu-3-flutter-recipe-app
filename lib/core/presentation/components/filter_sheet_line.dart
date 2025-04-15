import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/filter_button.dart';
import 'package:recipe_app/core/presentation/components/rating_button.dart';
import 'package:recipe_app/data/enums/filter_enum.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FilterSheetLine extends StatelessWidget {
  final FilterEnum filterType;
  final List<String> items;
  final String selectFilter;
  final void Function(String value) onSelected;
  const FilterSheetLine({
    super.key,
    required this.filterType,
    required this.items,
    required this.selectFilter,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(filterType.title, style: AppTextStyles.smallBold),
        Wrap(
          spacing: 10,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                onSelected(items[index]);
              },
              child:
                  filterType != FilterEnum.rate
                      ? FilterButton(
                        text: items[index],
                        isSelected: items[index] == selectFilter,
                      )
                      : RatingButton(
                        text: items[index],
                        isSelected: items[index] == selectFilter,
                      ),
            );
          }),
        ),
      ],
    );
  }
}
