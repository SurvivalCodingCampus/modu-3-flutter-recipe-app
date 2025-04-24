import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/buttons/box_icon_button.dart';
import 'package:recipe_app/presentation/component/dish_card.dart';
import 'package:recipe_app/presentation/component/form/search_bar.dart';
import 'package:recipe_app/presentation/component/recipe_category_selector.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_screen_state.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenState state;
  final void Function(HomeAction action) onAction;

  const HomeScreen({super.key, required this.state, required this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Jega',
                    style: TextStyles.largeTextBold.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                  Text(
                    'What are you cooking today?',
                    style: TextStyles.smallTextRegular.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: ColorStyles.secondary40,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.verified_user_sharp),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: SearchInput(
                  onTap: () => onAction(const HomeAction.onTapSearchBar()),
                  hintText: 'Search recipes',
                  onSubmitted: (value) {},
                ),
              ),
              BoxIconButton(onPressed: () {}, icon: Icons.tune),
            ],
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 37,
            child: RecipeCategorySelector(
              categories: const [
                'All',
                'Indian',
                'Italian',
                'Asian',
                'Chinese',
              ],
              onSelect: (category) {
                onAction(HomeAction.onTapCategory(category));
              },
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 231,
            child: Builder(
              builder: (context) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return DishCard(
                    recipes: state.savedRecipes,
                    onTapCard:
                        (int recipeId) =>
                            onAction(HomeAction.onTapCard(recipeId)),
                    onTapBookmark:
                        (int recipeId) =>
                            onAction(HomeAction.onTapBookmark(recipeId)),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
