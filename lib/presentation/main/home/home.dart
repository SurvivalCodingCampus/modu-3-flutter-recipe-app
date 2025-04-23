import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/new_recipe_card.dart';
import 'package:recipe_app/ui/color_styles.dart';

import '../../../ui/text_styles.dart';
import '../../component/category_tabs.dart';
import '../../component/dish_card.dart';
import '../../component/filter_small_button.dart';
import 'home_action.dart';
import 'home_view_model.dart';

class Home extends StatefulWidget {
  final void Function(HomeAction action) onAction;
  final HomeViewModel viewModel;

  const Home({super.key, required this.viewModel, required this.onAction});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final recipes = widget.viewModel.state.recipes;
    final filteredRecipes = widget.viewModel.state.filteredRecipes;

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (BuildContext context, Widget? child) {
        final recipes = widget.viewModel.state.recipes;
        final filteredRecipes = widget.viewModel.state.filteredRecipes;
        return ListView(
          padding: const EdgeInsets.only(left: 25),
          children: [
            const SizedBox(height: 90),

            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Jega',
                        style: TextStyles.largeBold.copyWith(fontSize: 20),
                      ),
                      Text(
                        'what are you cooking today?',
                        style: TextStyles.smallerRegular.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorStyles.secondary40,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/men.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Row(
                children: [
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 45),
                      child: GestureDetector(
                        onTap: () {
                          context.push('/search');
                        },
                        child: AbsorbPointer(
                          child: TextField(
                            readOnly: true,
                            style: TextStyles.smallerRegular.copyWith(
                              fontSize: 11,
                            ),
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              hintText: 'Search recipe',
                              hintStyle: TextStyles.smallerRegular.copyWith(
                                color: ColorStyles.gray4,
                                fontSize: 11,
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: ColorStyles.gray4,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorStyles.gray4,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: ColorStyles.gray4,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilterSmallButton(onTap: () {}),
                ],
              ),
            ),

            const SizedBox(height: 30),

            CategoryTabs(
              categories: widget.viewModel.state.categoryList,
              onSelected: (category) {
                widget.viewModel.updateCategory(category);
              },
              onAction: (action) {
                if (action is OnSelectCategory) {
                  widget.viewModel.updateCategory(action.category);
                }
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filteredRecipes.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];
                  return DishCard(
                    isBookMarked: recipe.isBookMarked,
                    onTap: () {
                      context.push('/detail', extra: recipe);
                    },
                    recipe: recipe,
                    onAction: (action) {
                      if (action is OnTapFavorite) {
                        widget.viewModel.toggleBookmark(action.recipe);
                      }
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            Text(
              'New Recipes',
              style: TextStyles.largeBold.copyWith(fontSize: 18),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 150,
              child:
                  recipes.isEmpty
                      ? const Center(child: Text('No new recipes'))
                      : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        // padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: recipes.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: NewRecipeCard(recipe: recipe),
                          );
                        },
                      ),
            ),

            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
