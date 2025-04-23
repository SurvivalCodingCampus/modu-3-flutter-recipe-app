import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/action/recipe_detail_action.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/recipe_detail_screen.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/recipe_detail_view_model.dart';
import 'package:recipe_app/presentation/screen/recipe_detail/state/recipe_detail_state.dart';

class RecipeDetailScreenRoot extends StatefulWidget {
  final int recipeId;
  final RecipeDetailViewModel viewModel;
  // 레시피 상세화면에서 필요한 데이터는 recipeId로 대체

  const RecipeDetailScreenRoot({
    super.key,
    required this.recipeId,
    required this.viewModel,
  });

  @override
  State<RecipeDetailScreenRoot> createState() => _RecipeDetailScreenRootState();
}

class _RecipeDetailScreenRootState extends State<RecipeDetailScreenRoot> {
  RecipeDetailViewModel get viewModel => widget.viewModel;
  RecipeDetailState get state => widget.viewModel.state;
  get recipeId => widget.recipeId;

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipe(widget.recipeId); // 최초 1회만 호출
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (_, __) {
        return RecipeDetailScreen(
          recipeId: recipeId,
          state: state,
          onAction: (RecipeDetailAction action) {
            switch (action) {
              case FetchRecipe():
                viewModel.fetchRecipe(action.recipeId);
              case ChangeTabIndex():
                viewModel.changeTabIndex(action.index);
            }
          },
        );
      },
    );
  }
}
