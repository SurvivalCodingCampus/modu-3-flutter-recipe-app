import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipe_view_model.dart';

class SearchRecipeScreenRoot extends StatelessWidget {
  final SearchRecipeViewModel viewModel;


  const SearchRecipeScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
        builder: (context, widget) {
        return SearchRecipeScreen(
          state: viewModel.state,
          onAction: (SearchRecipeAction action) {
            viewModel.onAction(action);
          }
        );
      }
    );
  }
}
