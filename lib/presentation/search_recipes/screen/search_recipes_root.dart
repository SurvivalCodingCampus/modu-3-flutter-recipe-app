import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/search_recipes/screen/search_recipes_screen.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_action.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

class SearchRecipeRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipeRoot({super.key, required this.viewModel});

  @override
  State<SearchRecipeRoot> createState() => _SearchRecipeRootState();
}

class _SearchRecipeRootState extends State<SearchRecipeRoot> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      builder: (BuildContext context, Widget? child) {
        return SearchRecipesSreen(
          controller: controller,
          onAction: widget.viewModel.action,
          onSettingsClick: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return FilterSearchBottomSheet(
                  state: widget.viewModel.state.filtetState,
                  onfilterClick: (filterState) {
                    widget.viewModel.action(
                      SearchRecipesAction.searchFilter(filterState),
                    );
                  },
                  onCancelClick: (filterState) {
                    widget.viewModel.action(
                      const SearchRecipesAction.findRecipes(),
                    );
                  },
                );
              },
            );
          },
          state: widget.viewModel.state,
        );
      },
      listenable: widget.viewModel,
    );
  }
}
