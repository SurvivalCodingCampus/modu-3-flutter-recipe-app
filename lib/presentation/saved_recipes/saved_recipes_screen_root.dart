import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreenRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreenRoot({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreenRoot> createState() => _SavedRecipesScreenRootState();
}

class _SavedRecipesScreenRootState extends State<SavedRecipesScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final state = widget.viewModel.state;

        return SavedRecipesScreen(
          state: state,
          onRetry: widget.viewModel.load,
          onTapFavorite: widget.viewModel.toggleBookmark,
          onTapRecipe: (recipe) async {
            await context.push(Routes.ingredientPath(recipe.id));
            widget.viewModel.load();
          },
          onClearError: widget.viewModel.clearError,
        );
      },
    );
  }
}
