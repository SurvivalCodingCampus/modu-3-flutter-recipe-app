import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreenRoot({super.key, required this.viewModel});

  @override
  State<StatefulWidget> createState() => _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchAll();
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
              case OnSubmitSearch():
                widget.viewModel.onAction(action);
              case OnApplyFilter():
                widget.viewModel.onAction(action);
              case OnTapBackArrow():
                context.pop();
            }
          },
        );
      },
    );
  }
}
