import 'package:flutter/cupertino.dart';
import 'package:recipe_app/presentation/component/custom_button.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_button.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/filter_search_state.dart';
import 'package:recipe_app/presentation/component/filter_search_bottom_sheet/rating_button.dart';
import 'package:recipe_app/ui/text_style.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchState state;

  const FilterSearchBottomSheet({
    super.key,
    this.state = const FilterSearchState(),
  });

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  late FilterSearchState _state = const FilterSearchState();

  @override
  void initState() {
    super.initState();
    _state = widget.state;
  }

  void _updateTime(FilterTime time) {
    setState(() => _state = _state.copyWith(time: time));
  }

  void _updateRate(int? rate) {
    setState(() => _state = _state.copyWith(rate: rate));
  }

  void _toggleCategory(FilterCategory category) {
    final current = _state.categories;

    // All이 선택되면 모든 카테고리를 선택 해제
    if (category == FilterCategory.all) {
      setState(() => _state = _state.copyWith(categories: []));
      return;
    }
    // 현재 카테고리 리스트에 All이 포함되어 있으면 All을 제외
    final updated =
        current.contains(category)
            ? current.where((c) => c != category).toList()
            : [...current.where((c) => c != FilterCategory.all), category];
    setState(() => _state = _state.copyWith(categories: updated));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 31, 30, 22),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Filter Search', style: AppTextStyles.smallBold()),
          const SizedBox(height: 12),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time', style: AppTextStyles.smallBold()),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children:
                        FilterTime.values.map((t) {
                          return FilterButton(
                            title: t.label,
                            isSelected: _state.time == t,
                            onPressed: () => _updateTime(t),
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text('Rate', style: AppTextStyles.smallBold()),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children:
                        [5, 4, 3, 2, 1].map((r) {
                          return RatingButton(
                            rate: r.toDouble(),
                            isSelected: _state.rate == r,
                            onPressed: () {
                              if (_state.rate == r) {
                                _updateRate(null);
                                return;
                              }
                              _updateRate(r);
                            },
                          );
                        }).toList(),
                  ),
                  const SizedBox(height: 16),
                  Text('Category', style: AppTextStyles.smallBold()),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children:
                        FilterCategory.values.map((c) {
                          final isSelected =
                              c == FilterCategory.all
                                  ? _state.categories.isEmpty ||
                                      _state.categories.contains(c)
                                  : _state.categories.contains(c);
                          return FilterButton(
                            title: c.label,
                            isSelected: isSelected,
                            onPressed: () => _toggleCategory(c),
                          );
                        }).toList(),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
          SmallButton(
            title: 'Filter',
            onTap: () => Navigator.pop(context, _state),
          ),
        ],
      ),
    );
  }
}
