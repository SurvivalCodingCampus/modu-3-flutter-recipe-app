import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/screen/search_recipes/action/search_recipe_action.dart';
import 'package:recipe_app/presentation/screen/search_recipes/filter_search_bottom_sheet.dart';
import 'package:recipe_app/presentation/screen/search_recipes/search_recipes_screen.dart';
import 'package:recipe_app/presentation/screen/search_recipes/search_recipes_view_model.dart';

import 'package:recipe_app/presentation/screen/search_recipes/state/search_recipe_state.dart';

class SearchRecipesScreenRoot extends StatefulWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreenRoot({super.key, required this.viewModel});

  @override
  State<SearchRecipesScreenRoot> createState() =>
      _SearchRecipesScreenRootState();
}

class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
  SearchRecipesViewModel get viewModel => widget.viewModel;
  SearchRecipeState get state => widget.viewModel.state;

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipe();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 전체 화면 조절 가능 모드
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50.0), // 상단 모서리를 둥글게 처리
        ),
      ),
      builder: (context) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListenableBuilder(
                // 상태 변경을 감지
                listenable: widget.viewModel,
                builder: (context, _) {
                  return FilterSearchBottomSheet(
                    state: state,
                    updateFilterSearchState: ({time, rate, category}) {
                      widget.viewModel.updateFilterSearchState(
                        time: time,
                        rate: rate,
                        category: category,
                      );
                    },
                    filterSearchRecipe:
                        viewModel.filterSearchRecipe, // 필터 로직 실행
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (_, __) {
        return SearchRecipesScreen(
          state: state,
          // searchRecipe: viewModel.searchRecipe,
          // showFilter: viewModel.showFilter,
          onAction: (SearchRecipeAction action) {
            switch (action) {
              case SearchRecipe():
                viewModel.searchRecipe(action.keyword);
              case ShowFilter():
                _showFilterBottomSheet(context);
            }
          },
        );
      },
    );
  }
}
