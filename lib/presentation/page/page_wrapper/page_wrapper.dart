import 'package:flutter/material.dart';
import 'package:recipe_app/core/common/page_animation_move.dart';
import 'package:recipe_app/data_source/recipes/recipe_data_source_impl.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/repository/recipes/recipe_repository_impl.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                PageAnimationMove().pushWithFade(
                  context: context,
                  second: 2,
                  page: SavedRecipesScreen(
                    model: SavedRecipesViewModel()..fetchData(),
                  ),
                );
              },
              child: Text("saved recipes page"),
            ),
            TextButton(
              onPressed: () {
                PageAnimationMove().pushWithFade(
                  context: context,
                  second: 2,
                  page: SearchRecipesScreen(
                    viewModel: SearchRecipesViewModel(
                      recipeRepository: RecipeRepositoryImpl(
                        dataSource: RecipeDataSourceImpl(),
                      ),
                    )..getRecipes(),
                  ),
                );
              },
              child: Text("search recipes page"),
            ),
          ],
        ),
      ),
    );
  }
}
