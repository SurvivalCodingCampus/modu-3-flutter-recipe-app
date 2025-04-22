import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

import '../component/filter_button.dart';

class FilterSearchBottom extends StatefulWidget {
  const FilterSearchBottom({super.key});

  @override
  State<FilterSearchBottom> createState() => _FilterSearchBottomState();
}

class _FilterSearchBottomState extends State<FilterSearchBottom> {
  String? selectedTime;
  String? selectedRate;
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 31, 30, 0),
      child: SizedBox(
        width: double.infinity,
        height: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Filter Search',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 24),

            /// Time
            Text('Time', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children:
                  ['All', 'Newest', 'Oldest', 'Popularity'].map((time) {
                    return FilterButton(
                      text: time,
                      isSelected: selectedTime == time,
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                    );
                  }).toList(),
            ),

            const SizedBox(height: 24),

            /// Rate
            Text('Rate', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children:
                  ['5', '4', '3', '2', '1'].map((rate) {
                    return RateButton(
                      text: rate,
                      isSelected: selectedRate == rate,
                      onTap: () {
                        setState(() {
                          selectedRate = rate;
                        });
                      },
                    );
                  }).toList(),
            ),

            const SizedBox(height: 24),

            /// Category
            Text('Category', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children:
                  [
                    'All',
                    'Cereal',
                    'Vegetables',
                    'Dinner',
                    'Chinese',
                    'Local Dish',
                    'Fruit',
                    'BreakFast',
                    'Spanish',
                    'Chinese',
                    'Lunch',
                  ].map((category) {
                    return FilterButton(
                      text: category,
                      isSelected: selectedCategory == category,
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    );
                  }).toList(),
            ),
            SizedBox(height: 30),

            /// Filter Button
            Center(
              child: Container(
                width: 174,
                height: 37,
                decoration: BoxDecoration(
                  color: ColorStyles.primary80,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    'Filter',
                    style: TextStyles.smallTextBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
