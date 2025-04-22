import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_action.dart';
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
          onAction: (action) async {
            switch (action) {
              case OnTapRecipe(:final recipe):
                await context.push(Routes.ingredientPath(recipe.id));
                widget.viewModel.load(); // 돌아왔을 때 다시 로딩
              default:
                widget.viewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
