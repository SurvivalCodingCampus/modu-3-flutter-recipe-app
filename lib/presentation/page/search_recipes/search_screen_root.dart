import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/recipe/recipe.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_screen.dart';

class SearchScreenRoot extends StatelessWidget {
  final SearchRecipesViewModel viewModel;
  List<Recipe>? lastSearchData;
  SearchScreenRoot({super.key, required this.viewModel, this.lastSearchData}) {
    viewModel.searchRecipesDataSave(list: lastSearchData);
    print("lastSearchData $lastSearchData");
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
          state: viewModel.state,
          onAction: viewModel.onAction,
        );
      },
    );
  }
}
