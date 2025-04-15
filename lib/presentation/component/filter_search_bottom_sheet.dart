import 'package:flutter/material.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/core/enums/time_filter.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/filter_search_state.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final void Function(
    TimeFilter timeFilter,
    int rate,
    CategoryFilter categoryFilter,
  ) onFilterChange;
  // final FilterSearchState state
  // fianl void Function(
  //     FilterSearchState filterSearchState
  //   )
  final TimeFilter timeFilter;
  final int rateFilter;
  final CategoryFilter categoryFilter;

  const FilterSearchBottomSheet({
    super.key,
    required this.onFilterChange,
    required this.timeFilter,
    required this.rateFilter,
    required this.categoryFilter,
});

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  FilterSearchState _state = FilterSearchState();

  @override
  void initState() {
    super.initState();
    _state = FilterSearchState(
      timeSelectedIndex: TimeFilter.values.indexOf(widget.timeFilter),
      rateSelectedIndex: widget.rateFilter,
      categorySelectedIndex: CategoryFilter.values.indexOf(
        widget.categoryFilter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorStyles.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Filter Search', style: TextStyles.normalBold())],
            ),
            SizedBox(height: 20),
            Text('Time', style: TextStyles.normalBold()),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(TimeFilter.values.length, (index) {
                return FilterButton(
                  text: TimeFilter.values[index].name,
                  star: false,
                  isSelected: _state.timeSelectedIndex == index,
                  onClick: () {
                    setState(() {
                      _state.timeSelectedIndex = index;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Rate', style: TextStyles.normalBold()),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(5, (index) {
                final reverseIndex = 5 - index;
                return RatingButton(
                  text: '$reverseIndex',
                  isSelected: _state.rateSelectedIndex == reverseIndex,
                  onClick: () {
                    setState(() {
                      if (_state.rateSelectedIndex == reverseIndex) {
                        _state.rateSelectedIndex = 0;
                      } else {
                        _state.rateSelectedIndex = reverseIndex;
                      }
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Category', style: TextStyles.normalBold()),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(10, (index) {
                return FilterButton(
                  text: CategoryFilter.values[index].name,
                  isSelected: _state.categorySelectedIndex == index,
                  star: index == 3 ? true : false,
                  onClick: () {
                    setState(() {
                      _state.categorySelectedIndex = index;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  buttonSize: ButtonSize.medium,
                  buttonText: 'Filter',
                  onClick: () {
                    widget.onFilterChange(
                      TimeFilter.values[_state.timeSelectedIndex],
                      _state.rateSelectedIndex,
                      CategoryFilter.values[_state.categorySelectedIndex],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
