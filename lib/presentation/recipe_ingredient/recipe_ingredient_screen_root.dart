import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/component/ingredient_more_button.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';
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
  IngredientMore selectedItem = IngredientMore.share;

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
          IngredientMoreButton(
            selectedItem: selectedItem,
            onSelected: (value) {
              setState(() {
                selectedItem = value;
              });
            },
            onTapRateRecipe: () {
              showDialog(
                context: context,
                builder:
                    (context) => RatingDialog(
                      title: 'Rate recipe',
                      onTap: (rate) {
                        context.pop();
                      },
                    ),
              );
            },
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
