import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/ui/ui.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
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
                        child: FilterButton(text: e),
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
                        child: RatingButton(rating: e.toDouble()),
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
                    ].map((e) => FilterButton(text: e)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
