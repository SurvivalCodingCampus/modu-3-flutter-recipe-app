import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_screen.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_view_model.dart';

class RecipeDetailScreenRoot extends StatefulWidget {
  final int recipeId;
  final RecipeDetailViewModel viewModel;

  const RecipeDetailScreenRoot({
    super.key,
    required this.recipeId,
    required this.viewModel,
  });

  @override
  State<RecipeDetailScreenRoot> createState() => _RecipeDetailScreenRootState();
}

class _RecipeDetailScreenRootState extends State<RecipeDetailScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final state = widget.viewModel.state;

        return RecipeDetailScreen(
          recipeId: widget.recipeId,
          state: state,
          onAction: (action) {
            widget.viewModel.onAction(action, recipeId: widget.recipeId);
          },
        );
      },
    );
  }
}
