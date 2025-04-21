import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/buttons/buttons.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet_state.dart';
import 'package:recipe_app/ui/ui.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchBottomSheetState state;
  final Function(FilterSearchBottomSheetState state) onApply;

  const FilterSearchBottomSheet({
    super.key,
    required this.state,
    required this.onApply,
  });

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  late FilterSearchBottomSheetState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.state.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              topRight: Radius.circular(50.0),
            ),
          ),
          child: Column(
            spacing: 30,
            children: [
              const Text('Filter Search', style: TextStyles.mediumTextBold),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Time', style: TextStyles.mediumTextBold),
                  ),
                  ChipSelector(
                    options: const ['All', 'Newest', 'Oldest', 'Popularity'],
                    selectedIndex: _state.timeIndex,
                    onSelected: (index) {
                      setState(() {
                        _state = _state.copyWith(timeIndex: index);
                      });
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Rate', style: TextStyles.mediumTextBold),
                  ),
                  ChipSelector(
                    options: const ['5', '4', '3', '2', '1'],
                    selectedIndex: _state.rateIndex,
                    icons: const [
                      Icons.star,
                      Icons.star,
                      Icons.star,
                      Icons.star,
                      Icons.star,
                    ],
                    onSelected: (index) {
                      setState(() {
                        _state = _state.copyWith(rateIndex: index);
                      });
                    },
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Category', style: TextStyles.mediumTextBold),
                  ),
                  MultiChipSelector(
                    spacing: 10,
                    runSpacing: 10,
                    selectedIndices: _state.categoryIndicies,
                    options: FilterSearchBottomSheetState.categories,
                    icons: const [null, null, null, Icons.star],
                    onSelected: (indicies) {
                      setState(() {
                        _state = _state.copyWith(categoryIndicies: indicies);
                      });
                    },
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  widget.onApply(_state);
                  Navigator.pop(context);
                },
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 174,
                      height: 37,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: ColorStyles.primary100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Filter',
                          style: TextStyles.smallTextBold.copyWith(
                            color: ColorStyles.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
