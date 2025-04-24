import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreenRoot extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, snapshot) {
        return SearchRecipesScreen(
          state: viewModel.state,
          onAction: (SearchRecipesAction action) {
            switch (action) {
              case OnSearch():
                viewModel.updateSearchString(action.value);
                viewModel.searchRecipes();
              case OnSetFilter():
                viewModel.setFilter(action.filterSearchState);
                Navigator.pop(context);
            }
          },
        );
      }
    );
  }
}
