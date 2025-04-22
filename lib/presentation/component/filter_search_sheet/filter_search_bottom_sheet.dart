import 'package:flutter/material.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/core/enums/time_filter.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/button_widget.dart';
import 'package:recipe_app/presentation/component/filter_search_sheet/filter_button.dart';
import 'package:recipe_app/presentation/component/filter_search_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/component/filter_search_sheet/rating_button.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchState state;
  final void Function(FilterSearchState filterSearchState) onFilterChange;

  const FilterSearchBottomSheet({
    super.key,
    required this.onFilterChange,
    required this.state,
  });

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  int _timeSelectedIndex = 0;
  int _rateSelectedIndex = 0;
  int _categorySelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _timeSelectedIndex = TimeFilter.values.indexOf(widget.state.timeFilter);
    _rateSelectedIndex = widget.state.rateFilter;
    _categorySelectedIndex = CategoryFilter.values.indexOf(
      widget.state.categoryFilter,
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
                  isSelected: _timeSelectedIndex == index,
                  onClick: () {
                    setState(() {
                      _timeSelectedIndex = index;
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
                  isSelected: _rateSelectedIndex == reverseIndex,
                  onClick: () {
                    setState(() {
                      if (_rateSelectedIndex == reverseIndex) {
                        _rateSelectedIndex = 0;
                      } else {
                        _rateSelectedIndex = reverseIndex;
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
                  isSelected: _categorySelectedIndex == index,
                  star: index == 3 ? true : false,
                  onClick: () {
                    setState(() {
                      _categorySelectedIndex = index;
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
                      FilterSearchState(
                        timeFilter: TimeFilter.values[_timeSelectedIndex],
                        rateFilter: _rateSelectedIndex,
                        categoryFilter: CategoryFilter.values[_categorySelectedIndex],
                      )
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
