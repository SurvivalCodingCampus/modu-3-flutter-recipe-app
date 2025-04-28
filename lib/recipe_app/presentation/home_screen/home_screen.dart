import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/recipe_app/presentation/component/dish_card.dart';
import 'package:recipe_app/recipe_app/presentation/component/new_recipe_button.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_bottom_sheet.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_action.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_state.dart';
import 'package:recipe_app/recipe_app/ui/color_styles.dart';
import 'package:recipe_app/recipe_app/ui/text_styles.dart';

import '../../core/routing/routes.dart';
import '../component/category_button.dart';

class HomeScreen extends StatefulWidget {
  final HomeScreenState state;
  final void Function(HomeScreenAction action) onAction;

  const HomeScreen({super.key, required this.state, required this.onAction});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _buildBody(context)));
  }

  Widget _buildBody(BuildContext context) {
    final state = widget.state;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello Jega', style: TextStyles.largeTextBold),
                    Text(
                      'What are you cooking today?',
                      style: TextStyles.smallerTextRegular,
                    ),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorStyles.secondary40,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset('assets/icons/character.png'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    onTap: () {
                      context.push(Routes.searchRecipes);
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorStyles.gray4),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorStyles.gray4),
                      ),
                      prefixIcon: Icon(Icons.search, size: 18),
                      prefixIconColor: ColorStyles.gray4,
                      hintText: 'Search recipe',
                      hintStyle: TextStyles.smallerTextRegular,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return FilterSearchBottomSheet(
                            filterSearchViewModel: getIt(),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorStyles.primary100,
                      padding: EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Image.asset(
                      'assets/icons/filter.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryButton(
                    categoryName: 'All',
                    selectedCategory: state.selectedCategory,
                    onTap:
                        () => widget.onAction(
                          HomeScreenAction.selectCategory('All'),
                        ),
                  ),
                  CategoryButton(
                    categoryName: 'Asian',
                    selectedCategory: state.selectedCategory,
                    onTap:
                        () => widget.onAction(
                          HomeScreenAction.selectCategory('Asian'),
                        ),
                  ),
                  CategoryButton(
                    categoryName: 'Korean',
                    selectedCategory: state.selectedCategory,
                    onTap:
                        () => widget.onAction(
                          HomeScreenAction.selectCategory('Korean'),
                        ),
                  ),
                  CategoryButton(
                    categoryName: 'Chinese',
                    selectedCategory: state.selectedCategory,
                    onTap:
                        () => widget.onAction(
                          HomeScreenAction.selectCategory('Chinese'),
                        ),
                  ),
                  CategoryButton(
                    categoryName: 'Japanese',
                    selectedCategory: state.selectedCategory,
                    onTap:
                        () => widget.onAction(
                          HomeScreenAction.selectCategory('Japanese'),
                        ),
                  ),
                  CategoryButton(
                    categoryName: 'Indian',
                    selectedCategory: state.selectedCategory,
                    onTap:
                        () => widget.onAction(
                          HomeScreenAction.selectCategory('Indian'),
                        ),
                  ),
                  CategoryButton(
                    categoryName: 'British',
                    selectedCategory: state.selectedCategory,
                    onTap:
                        () => widget.onAction(
                          HomeScreenAction.selectCategory('British'),
                        ),
                  ),
                  CategoryButton(
                    categoryName: 'French',
                    selectedCategory: state.selectedCategory,
                    onTap:
                        () => widget.onAction(
                          HomeScreenAction.selectCategory('French'),
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.state.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = widget.state.recipes[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 15),
                    child: GestureDetector(
                      onTap: () async {
                        await context
                            .push('/detail-screen-root/${recipe.id}')
                            .then((value) {});
                      },
                      child: DishCard(
                        recipe: recipe,
                        onTapFavorite: () {
                          widget.onAction(
                            recipe.bookMarked
                                ? HomeScreenAction.removeBookMark(recipe.id)
                                : HomeScreenAction.addBookMark(recipe),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              'New Recipes',
              style: TextStyles.normalTextBold.copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.state.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = widget.state.recipes[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, right: 15),
                    child: GestureDetector(
                      onTap: () async {
                        await context
                            .push('/detail-screen-root/${recipe.id}')
                            .then((value) {});
                      },
                      child: NewRecipeButton(recipe: recipe),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
