import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_state.dart';
import 'package:recipe_app/feature/receipe/presentation/widgets/recipe_card.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesState state;
  final void Function(SavedRecipesAction action) onAction;
  const SavedRecipesScreen({
    required this.onAction,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StateHandling(
      state.viewState,
      complete: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.separated(
          itemCount: state.data.length,
          itemBuilder: (context, index) {
            final recipe = state.data[index];
            final id = recipe.id;
            return RecipeCard.fromModel(
              recipe: recipe,
              bookmarkTap:
                  () => onAction(SavedRecipesAction.bookmarkRecipe(id)),
              cardTap:
                  () =>
                      context.pushNamed('info', pathParameters: {'id': '$id'}),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 20);
          },
        ),
      ),
    );
  }
}
