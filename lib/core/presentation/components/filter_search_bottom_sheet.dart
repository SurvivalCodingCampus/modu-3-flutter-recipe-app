import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/filter_sheet_line.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';
import 'package:recipe_app/data/enums/filter_enum.dart';
import 'package:recipe_app/presentation/search_recipes/filter_state.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterState state;
  final void Function(FilterState state) onfilterClick;
  final void Function(FilterState state) onCancelClick;
  const FilterSearchBottomSheet({
    super.key,
    required this.state,
    required this.onfilterClick,
    required this.onCancelClick,
  });

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  late FilterState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 560,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 31, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('Filter Search', style: AppTextStyles.smallBold),
              ),
              const SizedBox(height: 20),
              FilterSheetLine(
                filterType: FilterEnum.time,
                items: const ['All', 'Newest', 'Oldest', 'Popularity'],
                selectFilter: _state.time,
                onSelected: (value) {
                  setState(() {
                    _state = _state.copyWith(time: value);
                  });
                },
              ),
              const SizedBox(height: 20),
              FilterSheetLine(
                filterType: FilterEnum.rate,
                items: const ['5', '4', '3', '2', '1'],
                selectFilter: _state.rate,
                onSelected: (value) {
                  setState(() {
                    _state = _state.copyWith(rate: value);
                  });
                },
              ),
              const SizedBox(height: 20),
              FilterSheetLine(
                filterType: FilterEnum.category,
                items: const [
                  'All',
                  'Cereal',
                  'Vegetables',
                  'Dinner',
                  'Local Dish',
                  'Fruit',
                  'BreakFast',
                  'Spanish',
                  'Chinese',
                  'Lunch',
                ],
                selectFilter: _state.category,
                onSelected: (value) {
                  setState(() {
                    _state = _state.copyWith(category: value);
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                spacing: 4,
                children: [
                  Expanded(
                    child: SmallButton(
                      text: 'Cancel',
                      color:
                          (_state.category != 'All' ||
                                  _state.time != 'All' ||
                                  _state.rate != '5')
                              ? ColorStyle.warning
                              : ColorStyle.gray4,
                      onClick: () {
                        setState(() {
                          _state = _state.copyWith(
                            category: 'All',
                            rate: '5',
                            time: 'All',
                          );
                        });
                        widget.onCancelClick(_state);
                      },
                    ),
                  ),
                  Expanded(
                    child: SmallButton(
                      text: 'Filter',
                      onClick: () {
                        widget.onfilterClick(_state);
                      },
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
