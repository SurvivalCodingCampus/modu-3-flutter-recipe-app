import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/feature/receipe/data/repository/home/recipe_repository_impl.dart';
import 'package:recipe_app/feature/receipe/data/data_source/home/mock/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/bookmark_recipes_use_case.dart';
import 'package:recipe_app/feature/receipe/domain/use_case/saved_recipes/get_saved_recipes_use_case.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

final _viewModel = SavedRecipesViewModel(
  getSavedRecipesUseCase: GetSavedRecipesUseCase(
    RecipeRepositoryImpl(MockRecipeDataSourceImpl()),
  ),
  bookmarkRecipesUseCase: BookmarkRecipesUseCase(
    RecipeRepositoryImpl(MockRecipeDataSourceImpl()),
  ),
);

class SavedRecipesScreen extends StatelessWidget {
  const SavedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: const Text('Saved recipes'),
        backgroundColor: AppColor.white,
      ),
      child: ListenableBuilder(
        listenable: _viewModel..fetchRecipes(),
        builder: (context, child) {
          final viewState = _viewModel.state.viewState;
          final recipes = _viewModel.state.data;

          return StateHandling(
            viewState,
            complete: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  final id = recipe.id;
                  return RecipeCard.fromModel(
                    recipe: recipe,
                    bookmarkTap: () => _viewModel.bookmarkRecipe(id),
                    cardTap:
                        () => context.pushNamed(
                          'info',
                          pathParameters: {'id': '$id'},
                        ),
                  );
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
