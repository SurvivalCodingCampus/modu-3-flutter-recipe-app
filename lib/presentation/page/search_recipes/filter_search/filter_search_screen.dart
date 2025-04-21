import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/common/component/color_text_button.dart';
import 'package:recipe_app/presentation/common/component/filter_button.dart';
import 'package:recipe_app/presentation/common/component/rating_button.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/common/ui/text_styles.dart';
import 'package:recipe_app/presentation/page/search_recipes/filter_search/filter_search_view_model.dart';

class FilterSearchScreen extends StatelessWidget {
  final FilterSearchViewModel viewModel;
  const FilterSearchScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Container(
          color: ColorStyle.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 30),
                Text(
                  'Filter Search',
                  style: AppTextStyles.smallBold(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Time',
                  style: AppTextStyles.smallBold(),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 10,
                  children:
                      viewModel.state.timeFilterList.map((item) {
                        return FilterButton(
                          text: item,
                          onTap: () {
                            if (viewModel.state.selectTimeString != item) {
                              viewModel.timeStringSet(timeString: item);
                            } else {
                              viewModel.timeStringSet(timeString: '');
                            }
                          },
                          isSelected: item == viewModel.state.selectTimeString,
                        );
                      }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Rate',
                  style: AppTextStyles.smallBold(),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 10,
                  children:
                      viewModel.state.rateFilterList.map((item) {
                        return RatingButton(
                          text: item,
                          onTap: () {
                            if (viewModel.state.selectRateString != item) {
                              viewModel.rateStringSet(rateString: item);
                            } else {
                              viewModel.rateStringSet(rateString: '');
                            }
                          },
                          isSelected: item == viewModel.state.selectRateString,
                        );
                      }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  'Category',
                  style: AppTextStyles.smallBold(),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children:
                      viewModel.state.categoryFilterList.map((item) {
                        return item == 'Dinner'
                            ? RatingButton(
                              text: item,
                              onTap: () {
                                if (viewModel.state.selectCategoryString != item) {
                                  viewModel.categoryStringSet(
                                    categoryString: item,
                                  );
                                }else{
                                  viewModel.categoryStringSet(
                                    categoryString: '',
                                  );
                                }
                              },
                              isSelected:
                                  item == viewModel.state.selectCategoryString,
                            )
                            : FilterButton(
                              text: item,
                              onTap: () {
                                viewModel.categoryStringSet(
                                  categoryString: item,
                                );
                              },
                              isSelected:
                                  item == viewModel.state.selectCategoryString,
                            );
                      }).toList(),
                ),
                SizedBox(height: 30),
                Center(
                  child: ColorTextButton(
                    buttonWidth: 174,
                    buttonHeight: 37,
                    buttonText: 'Filter',
                    buttonColor: ColorStyle.primary100,
                    textColor: ColorStyle.white,
                    buttonRadius: 10,
                    onPressed: () {
                      Navigator.pop(context, {
                        'selectTimeString': viewModel.state.selectTimeString,
                        'selectRateString': viewModel.state.selectRateString,
                        'selectCategoryString':
                            viewModel.state.selectCategoryString,
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
