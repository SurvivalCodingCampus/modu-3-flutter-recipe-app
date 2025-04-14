import 'package:flutter/material.dart';
import 'package:recipe_app/data/util/category_enum.dart';
import 'package:recipe_app/data/util/rate_enum.dart';
import 'package:recipe_app/data/util/time_enum.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class FilterSearchBottomSheet extends StatelessWidget {
  final FilterSearchViewModel viewModel;
  final SearchRecipesViewModel searchViewModel;
  const FilterSearchBottomSheet({
    super.key,
    required this.viewModel,
    required this.searchViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: ColorStyles.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Filter Search", style: TextStyles.smallTextBold),
                ),
                SizedBox(height: 20),
                Text("Time", style: TextStyles.smallTextBold),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (final time in Time.values) ...[
                      FilterButton(
                        value: time,
                        color: ColorStyles.primary100,
                        ontap: () {
                          viewModel.onTapButton(time);
                        },
                      ),
                      SizedBox(width: 10),
                    ],
                  ],
                ),
                SizedBox(height: 20),
                Text("Rate", style: TextStyles.smallTextBold),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int index = 0; index < 5; index++) ...[
                      RatingButton(
                        rate: '${index + 1}',
                        color: ColorStyles.primary100,
                        ontap: () {
                          print('레이팅 ${index + 1} 버튼 클릭');
                          if (index.ceil() == 2) {
                            viewModel.onTapButton(Rate.star2);
                          } else if (index.ceil() == 3) {
                            viewModel.onTapButton(Rate.star3);
                          } else if (index.ceil() == 4) {
                            viewModel.onTapButton(Rate.star4);
                          } else if (index.ceil() == 5) {
                            viewModel.onTapButton(Rate.star5);
                          } else {
                            viewModel.onTapButton(Rate.star1);
                          }
                        },
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 20),
                Text("Category", style: TextStyles.smallTextBold),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children:
                      Categories.values
                          .map(
                            (e) => FilterButton(
                              value: e,
                              color: ColorStyles.primary100,
                              ontap: () {
                                viewModel.onTapButton(e);
                              },
                            ),
                          )
                          .toList(),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: SmallButton(
                    name: "Filter",
                    onClick: () async {
                      await searchViewModel.fetchFilterdRecipes(
                        viewModel.state.filter,
                      );
                      Navigator.pop(context);
                    },
                    color: ColorStyles.primary100,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
