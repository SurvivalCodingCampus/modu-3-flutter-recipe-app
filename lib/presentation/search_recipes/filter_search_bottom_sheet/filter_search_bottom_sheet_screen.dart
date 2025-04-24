import 'package:flutter/material.dart';

import '../../component/filter_button.dart';
import '../../component/rating_button.dart';
import '../../component/small_button.dart';
import '../../ui/color_styles.dart';
import '../../ui/text_styles.dart';
import 'filter_search_state.dart';

class FilterSearchBottomSheetScreen extends StatefulWidget {
  FilterSearchBottomSheetScreen({super.key});

  FilterSearchState _state = const FilterSearchState();


  FilterSearchState get state  => _state;

  @override
  State<FilterSearchBottomSheetScreen> createState() =>
      _FilterSearchBottomSheetScreenState();
}

class _FilterSearchBottomSheetScreenState
    extends State<FilterSearchBottomSheetScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // 배경색
          //borderRadius: BorderRadius.circular(60), // 둥근 모서리 (숫자가 클수록 더 둥글어요)
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('Filter Search', style: AppTextStyles.smallBold),
              ),
              const SizedBox(height: 16),

              // Time Section
              Text('Time', style: AppTextStyles.smallBold),
              const SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          FilterButton(
                            lable: 'All',
                            onPressed: (value) {},
                            isSelected: true,
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            lable: 'Newest',
                            onPressed: (value) {},
                            isSelected: false,
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            lable: 'Oldest',
                            onPressed: (value) {},
                            isSelected: false,
                          ),
                          const SizedBox(width: 8),
                          FilterButton(
                            lable: 'Popularity',
                            onPressed: (value) {},
                            isSelected: false,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Rate Section
                  Text('Rate', style: AppTextStyles.smallBold),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Row(
                        children: [
                          RatingButton(
                            number: '5',
                            onPressed: (value) {},
                            isSelected: false,
                          ),
                          const SizedBox(width: 8),
                          RatingButton(
                            number: '4',
                            onPressed: (value) {},
                            isSelected: false,
                          ),
                          const SizedBox(width: 8),
                          RatingButton(
                            number: '3',
                            onPressed: (value) {},
                            isSelected: false,
                          ),
                          const SizedBox(width: 8),
                          RatingButton(
                            number: '2',
                            onPressed: (value) {},
                            isSelected: false,
                          ),
                          const SizedBox(width: 8),
                          RatingButton(
                            number: '1',
                            onPressed: (value) {},
                            isSelected: true,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Category Section
                  Text('Category', style: AppTextStyles.smallBold),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      FilterButton(
                        lable: 'All',
                        onPressed: (value) {},
                        isSelected: true,
                      ),
                      FilterButton(
                        lable: 'Cereal',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Vegetables',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Dinner',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Chinese',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Local Dish',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Fruit',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Breakfast',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Spanish',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Chinese',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                      FilterButton(
                        lable: 'Lunch',
                        onPressed: (value) {},
                        isSelected: false,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Filter Button
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: SmallButton(
                        lable: 'Filter',
                        onClick: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
