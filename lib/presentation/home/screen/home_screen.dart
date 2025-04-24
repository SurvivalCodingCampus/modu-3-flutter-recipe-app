import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/dish_card.dart';
import 'package:recipe_app/core/presentation/components/home_category_rail.dart';
import 'package:recipe_app/core/presentation/components/search_zone.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_state.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final void Function(HomeAction action) onAction;
  final HomeState state;
  final String selectedCategory;
  const HomeScreen({
    super.key,
    required this.onAction,
    required this.state,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const _ProfileLine(),
                const SizedBox(height: 30),
                SearchZone(
                  isMain: true,
                  onChange: (String value) {},
                  onSettingsClick: () {
                    onAction(const HomeAction.onSearchTap());
                  },
                  onTap: () {
                    onAction(const HomeAction.onSearchTap());
                  },
                ),
                const SizedBox(height: 15),
                HomeCategoryRail(
                  selectedCategory: selectedCategory,
                  onCategoryClick: (value) {
                    onAction(HomeAction.onCategoryClick(value));
                  },
                  categoryList: const [
                    'All',
                    'Indian',
                    'Italian',
                    'Asian',
                    'Chinese',
                    'Japanese',
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 231,
                  child: ListView.separated(
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 15),
                    scrollDirection: Axis.horizontal,
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      return DishCard(
                        isBookmark: state.bookmarkIds.contains(
                          state.recipes[index].id,
                        ),
                        recipe: state.recipes[index],
                        onBookmarkClick: (int value) {
                          onAction(HomeAction.onBookmarkClick(value));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileLine extends StatelessWidget {
  const _ProfileLine();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello Jega', style: AppTextStyles.largeBold),
              Text(
                'What are you cooking today?',
                style: AppTextStyles.smallRegular.copyWith(
                  color: ColorStyle.gray3,
                ),
              ),
            ],
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 50,
            color: ColorStyle.secondary40,
            child: Image.asset('assets/images/drake.png'),
          ),
        ),
      ],
    );
  }
}
