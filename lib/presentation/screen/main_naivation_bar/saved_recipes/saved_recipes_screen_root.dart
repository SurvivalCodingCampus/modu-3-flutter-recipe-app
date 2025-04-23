import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/action/saved_recipe_action.dart';

import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_view_model.dart';

import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/state/saved_recipe_state.dart';

class SavedRecipesScreenRoot extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreenRoot({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreenRoot> createState() => _SavedRecipesScreenRootState();
}

class _SavedRecipesScreenRootState extends State<SavedRecipesScreenRoot> {
  SavedRecipesViewModel get viewModel => widget.viewModel;
  SavedRecipeState get state => widget.viewModel.state;

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchSavedRecipe(); // 저장된 레시피 목록 가져오기
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (_, __) {
        return SavedRecipesScreen(
          state: state,
          onAction: (SavedRecipeAction action) {
            switch (action) {
              case FetchSavedRecipe():
                viewModel.fetchSavedRecipe();
              case SetRecipeCardState():
                viewModel.setRecipeCardState(action.recipe);
              case RemoveToggle():
                viewModel.removeToggle(action.targetRecipeId);
            }
          },
        );
      },
    );
  }
}
