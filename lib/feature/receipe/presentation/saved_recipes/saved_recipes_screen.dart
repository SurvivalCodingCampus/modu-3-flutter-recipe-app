import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  const SavedRecipesScreen(this.viewModel, {super.key});

  @override
  Widget build(BuildContext context) {
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
                  final id = recipe.id;
                  return RecipeCard.fromModel(
                    recipe: recipe,
                    bookmarkTap: () => viewModel.bookmarkRecipe(id),
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
