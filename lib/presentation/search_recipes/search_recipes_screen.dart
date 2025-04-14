import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/recipe_grid_card.dart';
import 'package:recipe_app/presentation/component/search_input_field.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel _viewModel;
  const SearchRecipesScreen({
    super.key,
    required SearchRecipesViewModel viewModel,
  }) : _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search recipes', style: TextFontStyle.mediumBold()),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              spacing: 20,
              children: [
                SearchInputField(
                  placeholder: 'Search recipes',
                  onValueChange: (value) {},
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorStyle.primary100,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune_rounded),
                    color: ColorStyle.white,
                  ),
                ),
              ],
            ),
            Text('Recent Search', style: TextFontStyle.normalBold()),

            Expanded(
              child: ListenableBuilder(
                listenable: _viewModel,
                builder: (context, child) {
                  return GridView.builder(
                    itemCount: _viewModel.state.recipes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ),
                    itemBuilder: (context, index) {
                      final recipe = _viewModel.state.recipes[index];
                      return RecipeGridCard(recipe: recipe);
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
