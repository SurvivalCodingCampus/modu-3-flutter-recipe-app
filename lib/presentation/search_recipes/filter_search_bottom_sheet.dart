import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/components/f_filter_buttons.dart';
import 'package:recipe_app/presentation/components/f_medium_button.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_state.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final void Function(FilterSearchState) onFilterApply;

  const FilterSearchBottomSheet({super.key, required this.onFilterApply});

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  FilterSearchState _state = FilterSearchState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('기본 바텀 시트 열기'),
        onPressed: () {
          _buildShowModalBottomSheet(context);
        },
      ),
    );
  }

  Future<dynamic> _buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 10),
                Text(
                  'Filter Search',
                  style: TextStyles.smallTextBold(color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Time',
                    style: TextStyles.smallTextBold(color: AppColors.black),
                  ),
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: FFilterButtons(
                    allFilters:
                        _state.timeFilterTypes.map((e) => e.name).toList(),
                    onTap: (index) {
                      setState(() {
                        _state = _state.copyWith(
                          selectedTimeFilterType: _state.timeFilterTypes[index],
                        );
                      });
                    },
                    hasStars:
                        _state.timeFilterTypes.map((e) => e.hasStar).toList(),
                    beforeSelectedIndex: _state.selectedTimeFilterType.index,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Rate',
                    style: TextStyles.smallTextBold(color: AppColors.black),
                  ),
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: FFilterButtons(
                    allFilters: _state.rateTypes.map((e) => e.name).toList(),
                    onTap: (index) {
                      setState(() {
                        _state = _state.copyWith(
                          selectedRateType: _state.rateTypes[index],
                        );
                      });
                    },
                    hasStars: _state.rateTypes.map((e) => e.hasStar).toList(),
                    beforeSelectedIndex: _state.selectedRateType.index,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Category',
                    style: TextStyles.smallTextBold(color: AppColors.black),
                  ),
                ),
                SizedBox(height: 10),
                IntrinsicHeight(
                  child: FFilterButtons(
                    allFilters:
                        _state.categoryFilterTypes.map((e) => e.name).toList(),
                    onTap: (index) {
                      setState(() {
                        _state = _state.copyWith(
                          selectedCategoryFilterType:
                              _state.categoryFilterTypes[index],
                        );
                      });
                    },
                    hasStars:
                        _state.categoryFilterTypes
                            .map((e) => e.hasStar)
                            .toList(),
                    beforeSelectedIndex: _state.selectedCategoryFilterType.index,
                  ),
                ),
                SizedBox(height: 20),
                FMediumButton(
                  text: 'Filter',
                  voidCallback: () {
                    widget.onFilterApply(_state);
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}
