import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';

import '../../data/data_source/mock_recipe_data_source_impl.dart';
import '../../data/repository/recipe_repository_impl.dart';
import '../../ui/text_styles.dart';
import '../saved_recipes/saved_recipes_screen.dart';
import '../saved_recipes/saved_recipes_view_model.dart';
import '../search_recipes/search_recipes_view_model.dart';

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
        children: [
          ElevatedButton(
            onPressed: () {
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
            child: Text('SavedRecipesScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => SearchRecipesScreen(
                        viewModel: SearchRecipesViewModel(
                          recipeRepository: RecipeRepositoryImpl(
                            recipeDataSource: MockRecipeDataSourceImpl(),
                          ),
                        )..fetchRecipes(),
                      ),
                ),
              );
            },
            child: Text('SearchRecipesScreen'),
          ),
        ],
      ),
    );
  }
}
