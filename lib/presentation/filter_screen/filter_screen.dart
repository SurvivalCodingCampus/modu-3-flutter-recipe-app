import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import '../component/filter_button.dart';
import '../component/rating_button.dart';
import '../component/small_button.dart';
import 'filter_screen_view_model.dart';

class FilterScreen extends StatelessWidget {
  final FilterScreenViewModel viewModel;

  const FilterScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Container(
          height: 450,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorStyles.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('Filter Search', style: TextStyles.smallBold)),
              const SizedBox(height: 16),

              // Time
              _SectionTitle('Time'),
              _FilterWrap(
                items: viewModel.state.timeList,
                selectedItem: viewModel.state.selectedTime,
                onSelected: (v) => viewModel.updateTime(v.first),
              ),

              // Rate
              _SectionTitle('Rate'),
              RatingButton(
                rate: 5,
                selectedItem: viewModel.state.rate,
                onSelected: (v) => viewModel.updateRate(v.first),
              ),

              // Category
              _SectionTitle('Category'),
              _FilterWrap(
                items: viewModel.state.categoryList,
                selectedItem: viewModel.state.selectedCategory,
                onSelected: (v) => viewModel.updateCategory(v.first),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: SmallButton(
                    text: 'Filter',
                    onClick: () {
                      Navigator.pop(
                        context,
                        FilterResult(
                          category: viewModel.state.selectedCategory,
                          rate: viewModel.state.rate,
                          time: viewModel.state.selectedTime,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    child: Text(text, style: TextStyles.smallBold),
  );
}

class _FilterWrap extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final Function(List<String>) onSelected;

  const _FilterWrap({
    required this.items,
    required this.onSelected,
    this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        spacing: 6,
        children:
            items
                .map(
                  (item) => FilterButton(
                    text: [item],
                    isSelected: item == selectedItem,
                    onSelected: onSelected,
                  ),
                )
                .toList(),
      ),
    );
  }
}

class FilterResult {
  final String? category;
  final int? rate;
  final String? time;

  FilterResult({this.category, this.rate, this.time});
}
