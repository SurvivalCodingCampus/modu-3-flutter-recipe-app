import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_state.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

class SavedRecipeScreenRoot extends StatefulWidget {
  final SavedRecipeViewModel viewModel;

  const SavedRecipeScreenRoot({super.key, required this.viewModel});

  @override
  State<SavedRecipeScreenRoot> createState() => _SavedRecipeScreenRootState();
}

class _SavedRecipeScreenRootState extends State<SavedRecipeScreenRoot> {
  SavedRecipeViewModel get viewModel => widget.viewModel;
  SavedRecipeState get state => viewModel.state;

  @override
  void initState() {
    super.initState();
    viewModel.fetchSavedRecipes();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return SavedRecipeScreen(state: state);
      },
    );
  }
}
