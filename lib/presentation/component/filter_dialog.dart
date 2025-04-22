// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';

import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/ui/ui.dart';

class FilterDialog extends StatefulWidget {
  final Filter filter;
  final Function(Filter) onTapFilter;

  const FilterDialog({
    super.key,
    required this.filter,
    required this.onTapFilter,
  });

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  late Filter filter;

  @override
  void initState() {
    super.initState();
    filter = widget.filter;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 31),
              const Center(
                child: Text('Filter Search', style: TextStyles.smallTextBold),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Time', style: TextStyles.smallTextBold),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ...['All', 'Newest', 'Oldest', 'Popularity'].map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: FilterButton(
                            text: e,
                            isSelected: filter.time == e,
                            onTap:
                                () => setState(
                                  () => filter = filter.copyWith(time: e),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Rate', style: TextStyles.smallTextBold),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ...[5, 4, 3, 2, 1].map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: RatingButton(
                            rating: e,
                            isSelected: filter.rate == e,
                            onTap:
                                () => setState(
                                  () => filter = filter.copyWith(rate: e),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.768,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Category', style: TextStyles.smallTextBold),
                    const SizedBox(height: 10),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        ...[
                          'All',
                          'Serial',
                          'Vegetables',
                          'Dinner',
                          'Chinese',
                          'Local Dish',
                          'Fruit',
                          'Breakfast',
                          'Spanish',
                          'Lunch',
                        ].map(
                          (e) => FilterButton(
                            text: e,
                            isSelected: filter.category == e,
                            onTap:
                                () => setState(
                                  () => filter = filter.copyWith(category: e),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SmallButton(
                  text: 'Filter',
                  onTap: () {
                    widget.onTapFilter(filter);
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
