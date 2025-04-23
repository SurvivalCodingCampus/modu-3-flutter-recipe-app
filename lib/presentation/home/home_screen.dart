import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/presentation/components/f_dish_card.dart';
import 'package:recipe_app/presentation/components/f_input_field.dart';
import 'package:recipe_app/presentation/components/f_recipe_category_selector.dart';
import 'package:recipe_app/presentation/components/f_search_filter_button.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_state.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class HomeScreen extends StatefulWidget {
  final HomeState state;
  final void Function(HomeAction action) onAction;

  const HomeScreen({super.key, required this.state, required this.onAction});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: IntrinsicHeight(
            child: Column(
              children: [
                _buildHeaderArea(),

                SizedBox(height: 30),

                _buildSearchBarArea(),

                SizedBox(height: 15),

                FRecipeCategorySelector(
                  onSelectCategory: (category) {
                    widget.onAction(HomeAction.onSelectCategory(category));
                  },
                  categories: widget.state.categories,
                ),

                SizedBox(height: 15,),

                SizedBox(
                  height: 231,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.state.selectedCategoryRecipes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: FDishCard(
                          recipe: widget.state.selectedCategoryRecipes[index],
                          onTapFavorite: (Recipe recipe) {
                            widget.onAction(HomeAction.onTapFavorite(recipe));
                          },
                        ),
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

  Row _buildSearchBarArea() {
    return Row(
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              widget.onAction(HomeAction.onSearchFieldTap());
            },
            child: AbsorbPointer(
              child: FInputField(
                placeHolder: 'Search recipe',
                value: '',
                isVisibleSearchIcon: true,
                onValueChange: (_) {},
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        FSearchFilterButton(voidCallback: () {}),
      ],
    );
  }

  Row _buildHeaderArea() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Jega',
              style: TextStyles.largeTextBold(color: AppColors.black),
            ),
            SizedBox(height: 5),
            Text(
              'What are you cooking today?',
              style: TextStyles.smallerTextRegular(color: AppColors.gray3),
            ),
          ],
        ),

        Spacer(),

        Container(
          decoration: BoxDecoration(
            color: AppColors.secondary40,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/images/profile_image.png',
            width: 40,
            height: 40,
          ),
        ),
      ],
    );
  }
}
