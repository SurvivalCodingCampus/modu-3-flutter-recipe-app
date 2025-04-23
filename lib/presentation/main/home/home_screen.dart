import 'package:flutter/material.dart';
import 'package:recipe_app/core/enums/category_filter.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/dish_card.dart';
import 'package:recipe_app/presentation/component/recipe_category_selector.dart';
import 'package:recipe_app/presentation/main/home/home_action.dart';
import 'package:recipe_app/presentation/main/home/home_state.dart';

class HomeScreen extends StatelessWidget {
  final void Function(HomeAction action) onAction;
  final HomeState state;

  const HomeScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hello Jega', style: TextStyles.largeBold()),
                      Text(
                        'What are you cooking today?',
                        style: TextStyles.smallerRegular(
                          color: ColorStyles.gray4,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: ColorStyles.secondary40,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/face.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      key: const Key('textField'),
                      readOnly: true,
                      onTap: () {
                        onAction(HomeAction.onSearchTap());
                      },
                      decoration: InputDecoration(
                        hintText: 'Search recipe',
                        hintStyle: TextStyles.smallRegular(
                          color: ColorStyles.gray4,
                        ),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: ColorStyles.gray4,
                          size: 30,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: ColorStyles.gray4,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: ColorStyles.gray4,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: ColorStyles.primary100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.tune,
                        size: 30,
                        color: ColorStyles.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            RecipeCategorySelector(
              onSelectCategory: (CategoryFilter category) {
                onAction(HomeAction.onSelectCategory(category));
              },
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 280,
              child: ListView.separated(
                padding: const EdgeInsets.only(left: 30),
                scrollDirection: Axis.horizontal,
                itemCount: state.filteredRecipes.length,
                itemBuilder: (context, index) {
                  return DishCard(
                    onTapFavorite: (int id) {
                      onAction(HomeAction.onTapFavorite(id));
                    },
                    recipe: state.filteredRecipes[index],
                    isBookmarked: state.userBookmarks.contains(
                      state.filteredRecipes[index].id,
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
