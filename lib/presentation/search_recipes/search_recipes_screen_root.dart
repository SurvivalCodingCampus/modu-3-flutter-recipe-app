import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;
  const SearchRecipesScreenRoot({super.key, required this.viewModel});

  @override
  State<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (mounted) {
        widget.viewModel.fetchAllRecipes();
        widget.viewModel.whenOpenScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return SearchRecipesScreen(
          state: widget.viewModel.state,
          onAction: (action) {
            switch (action) {
              case OnFilterTap():
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return FilterSearchBottomSheet(
                      viewModel: FilterSearchViewModel(),
                      searchViewModel: widget.viewModel,
                    );
                  },
                );
              case OnValueChange():
                widget.viewModel.fetchSearchedRecipes(action.value);
            }
          },
        );
      },
    );
  }
}
