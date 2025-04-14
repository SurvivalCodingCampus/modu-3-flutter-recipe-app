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
              Center(
                child: Text(
                  'Filter Search',
                  style: TextStyles.smallBold.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Time
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 30, bottom: 10),
                    child: Text(
                      'Time',
                      style: TextStyles.smallBold.copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      children:
                          viewModel.state.timeList.map((time) {
                            return FilterButton(
                              text: [time],
                              onSelected: (selectedTime) {
                                viewModel.updateTime(selectedTime.first);
                              },
                            );
                          }).toList(),
                    ),
                  ),

                  // Rate
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 30,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Text(
                      'Rate',
                      style: TextStyles.smallBold.copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: RatingButton(
                      rate: 5,
                      onSelected: (selectedRate) {
                        viewModel.updateRate(selectedRate.first);
                      },
                    ),
                  ),

                  // Category
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 30,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Text(
                      'Category',
                      style: TextStyles.smallBold.copyWith(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      children:
                          viewModel.state.categoryList.map((category) {
                            return FilterButton(
                              text: [category],
                              onSelected: (selectedCategory) {
                                viewModel.updateCategory(
                                  selectedCategory.first,
                                );
                              },
                            );
                          }).toList(),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 10),
                  child: SmallButton(
                    text: 'Filter',
                    onClick: () {
                      Navigator.pop(context);
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
