import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/filter/filter_enum.dart';
import 'package:recipe_app/core/component/buttons.dart';
import 'package:recipe_app/core/component/filter_button.dart';
import 'package:recipe_app/core/component/rating_button.dart';

import 'package:recipe_app/core/ui_styles/text_styles.dart';
import 'package:recipe_app/presentation/screen/search_recipes/state/search_recipe_state.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final SearchRecipeState state;
  // final void Function(SearchRecipesEvent event) onEvent;
  final void Function({Time? time, int? rate, Category? category})
  updateFilterSearchState;
  final VoidCallback filterSearchRecipe;

  const FilterSearchBottomSheet({
    super.key,
    required this.state,
    // required this.onEvent,
    required this.updateFilterSearchState,
    required this.filterSearchRecipe,
  });

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final filterState = widget.state.filterSearchState;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text('Fliter Search', style: AppTextStyles.smallBold()),
          ),
          // **Time 섹션**
          Text('Time', style: AppTextStyles.smallBold()),

          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                Time.values.map((time) {
                  return FilterButton(
                    text:
                        time.name[0].toUpperCase() +
                        time.name.substring(1), // 첫 문자만 대문자로
                    isSelected: filterState.time == time,
                    onChange: () {
                      widget.updateFilterSearchState(time: time);
                    },
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),

          // **Rate 섹션**
          Text('Rate', style: AppTextStyles.smallBold()),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(5, (index) {
              final rate = index + 1; // 1부터 5까지의 숫자
              return RatingButton(
                text: rate.toString(),
                isSelected: filterState.rate == rate,
                icon: Icons.star,
                onChange: () {
                  widget.updateFilterSearchState(rate: rate);
                },
              );
            }),
          ),
          const SizedBox(height: 20),

          // **Category 섹션**
          const Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                Category.values.map((category) {
                  return FilterButton(
                    text:
                        category.name[0].toUpperCase() +
                        category.name.substring(1), // 카테고리 이름
                    isSelected: filterState.category == category,
                    onChange: () {
                      widget.updateFilterSearchState(category: category);
                    },
                  );
                }).toList(),
          ),
          const SizedBox(height: 30),

          // **Filter 버튼 (하단)**
          Center(
            child: Buttons(
              text: 'Filter',
              size: ButtonSize.small,
              onPressed: () {
                widget.filterSearchRecipe();
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
