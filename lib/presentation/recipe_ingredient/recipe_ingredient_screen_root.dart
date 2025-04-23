import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_action.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';

class RecipeIngredientScreenRoot extends StatefulWidget {
  final String recipeId;
  final RecipeIngredientViewModel viewModel;
  const RecipeIngredientScreenRoot({
    super.key,
    required this.recipeId,
    required this.viewModel,
  });

  @override
  State<RecipeIngredientScreenRoot> createState() =>
      _RecipeIngredientScreenRootState();
}

class _RecipeIngredientScreenRootState
    extends State<RecipeIngredientScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.loadRecipeIngredient(widget.recipeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset('assets/icons/more.png', width: 24, height: 24),
          ),
        ],
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, child) {
          if (widget.viewModel.state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (widget.viewModel.state.recipe == null) {
            return const Center(child: Text('데이터가 없습니다'));
          }

          return RecipeIngredientScreen(
            state: widget.viewModel.state,
            onAction: (action) {
              switch (action) {
                case OnTapTabItem():
                  widget.viewModel.onTapTabItem(action.index);
              }
            },
          );
        },
      ),
    );
  }
}
