import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_action.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_screen.dart';
import 'package:recipe_app/presentation/ingredient/recipe_ingredient/recipe_ingredient_view_model.dart';

class RecipeIngredientScreenRoot extends StatelessWidget {
  final RecipeIngredientViewModel viewModel;

  const RecipeIngredientScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, snapshot) {
        return RecipeIngredientScreen(
          state: viewModel.state,
          onAction: (RecipeIngredientAction action) async {
            switch (action) {
              case OnBookmark():
                viewModel.toggleBookmark(action.id);
              case OnTabSelect():
                viewModel.onTabSelect(action.index);
              case OnRating():
                await _showMyDialog(context);
            }
          },
        );
      }
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          backgroundColor: ColorStyles.white,
          content: RatingDialog(
            title: 'Rate recipe',
            actionName: 'Send',
            onChange: (int rateValue) {
              viewModel.onRating(rateValue);
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
