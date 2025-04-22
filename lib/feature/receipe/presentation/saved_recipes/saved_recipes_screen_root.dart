import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/presentation/pages/base_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/feature/receipe/presentation/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreenRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;
  const SavedRecipesScreenRoot(this.viewModel, {super.key});

  @override
  State<SavedRecipesScreenRoot> createState() => _SavedRecipesScreenRootState();
}

class _SavedRecipesScreenRootState extends State<SavedRecipesScreenRoot> {
  @override
  void initState() {
    widget.viewModel.onAction(const SavedRecipesAction.fetchRecipes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: const Text('Saved recipes'),
        backgroundColor: AppColor.white,
      ),
      child: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          final state = widget.viewModel.state;

          return SavedRecipesScreen(
            onAction: widget.viewModel.onAction,
            state: state,
          );
        },
      ),
    );
  }
}
