import 'package:flutter/material.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/feature/receipe/data/repository/home/recipe_repository_impl.dart';
import 'package:recipe_app/feature/receipe/data/data_source/home/mock/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/get_saved_recipes_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SavedRecipesViewModel(
      GetSavedRecipesUseCase(RecipeRepositoryImpl(MockRecipeDataSourceImpl())),
    );
    return BaseScreen(
      appBar: AppBar(
        title: const Text('Saved recipes'),
        backgroundColor: AppColor.white,
      ),
      child: ListenableBuilder(
        listenable: viewModel..fetchRecipes(),
        builder: (context, child) {
          final viewState = viewModel.state.viewState;
          final recipes = viewModel.state.data;

          return StateHandling(
            viewState,
            complete: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard.fromModel(recipe);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
