import 'package:flutter/material.dart';
import 'package:recipe_app/core/enum/buttom_enum.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';
import 'package:recipe_app/presentation/pages/recipe/search/view_model/filter_view_model.dart';
import 'package:recipe_app/presentation/widgets/base/button/app_button.dart';
import 'package:recipe_app/presentation/widgets/recipe/filter_button.dart';
import 'package:recipe_app/presentation/widgets/recipe/rating_button.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = FilterViewModel();
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text('Filter Search', style: AppTextStyle.smallBold),
              ),
              Text('Time', style: AppTextStyle.smallBold),
              const SizedBox(height: 10),
              Row(
                children:
                    _time
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: FilterButton(
                              text: e,
                              isSelected: viewModel.state.time == e,
                              onTap: () {
                                viewModel.filter(time: e);
                              },
                            ),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 20),
              Text('Rate', style: AppTextStyle.smallBold),
              const SizedBox(height: 10),
              Row(
                children:
                    _rates
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: RatingButton(
                              text: '$e',
                              isSelected: viewModel.state.rate == e,
                              onTap: () {
                                viewModel.filter(rate: e);
                              },
                            ),
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 20),
              Text('Category', style: AppTextStyle.smallBold),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                direction: Axis.horizontal,
                children:
                    _categories
                        .map(
                          (e) => FilterButton(
                            text: e,
                            isSelected: viewModel.state.category == e,
                            onTap: () {
                              viewModel.filter(category: e);
                            },
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 30),
              Center(
                child: AppButton(
                  text: 'Filter',
                  onClick: () {},
                  type: ButtonType.small,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static const List<int> _rates = [5, 4, 3, 2, 1];
  static const List<String> _time = ['All', 'Newest', 'Oldest', 'Popularity'];
  static const List<String> _categories = [
    'All',
    'Cereal',
    'Vegetables',
    'Dinner ⭐️',
    'Chinese',
    'Local Dish',
    'Fruit',
    'BreakFast',
    'Spanish',
    'Chinese',
    'Lunch',
  ];
}
