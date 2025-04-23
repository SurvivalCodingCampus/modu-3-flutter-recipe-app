import 'package:flutter/material.dart';
import 'package:recipe_app/data/util/category_enum.dart';
import 'package:recipe_app/presentation/component/filter_list.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/recipe_category_selector.dart';
import 'package:recipe_app/presentation/home/components/dish_card.dart';
import 'package:recipe_app/presentation/home/home_action.dart';
import 'package:recipe_app/presentation/home/home_state.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello Jega", style: TextStyles.largeTextBold),
                      Text(
                        "What are you cooking today?",
                        style: TextStyles.smallerTextRegular.copyWith(
                          color: ColorStyles.gray3,
                        ),
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
                    child: Image.asset('assets/images/home_profile.png'),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 260,
                    child: InputField(
                      label: '',
                      placeHolder: 'Search recipe',
                      isSearch: true,
                      controller: TextEditingController(text: ''),
                      onValueChange: (String value) async {},
                      onTap: () {
                        widget.onAction(HomeAction.onSearchTap());
                      },
                    ),
                  ),
                  FilterList(
                    ontap: () {
                      widget.onAction(HomeAction.onSearchTap());
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            RecipeCategorySelector(
              categories: Categories.values,
              selectedIndex: widget.state.selectedIndex,
              onSelectTap: (index) {
                widget.onAction(HomeAction.onSelectTap(index));
              },
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 231,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.state.allRecipes.length,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 15);
                },
                itemBuilder: (context, index) {
                  final recipe = widget.state.allRecipes[index];
                  return DishCard(
                    recipe: recipe,
                    isBookmarked: widget.state.bookmarkList.contains(
                      recipe.recipeId,
                    ),
                    onBookmarkTap: (recipeId) {
                      widget.onAction(HomeAction.onBookmarkTap(recipeId));
                    },
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
