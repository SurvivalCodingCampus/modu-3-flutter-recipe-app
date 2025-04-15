import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen', style: TextStyles.mediumBold()),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => SavedRecipesScreen(
                    viewModel: SavedRecipesViewModel(
                      recipeRepository: RecipeRepositoryImpl(
                        recipeDataSource: MockRecipeDataSourceImpl(),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: ColorStyles.primary80,
              child: Center(child: Text('SavedRecipesScreen 가기')),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => SearchRecipesScreen(
                    viewModel: SearchRecipesViewModel(
                      recipeRepository: RecipeRepositoryImpl(
                        recipeDataSource: MockRecipeDataSourceImpl(),
                      ),
                    ),
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              height: 100,
              color: ColorStyles.primary80,
              child: Center(child: Text('SearchRecipesScreen 가기')),
            ),
          ),
        ],
      ),
    );
  }
}
