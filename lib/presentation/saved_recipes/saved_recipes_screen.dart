import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel _viewModel;
  const SavedRecipesScreen({
    super.key,
    required SavedRecipesViewModel savedRecipesViewModel,
  }) : _viewModel = savedRecipesViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyle.primary20,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text('Saved recipes', style: TextFontStyle.mediumBold()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListenableBuilder(
              listenable: _viewModel,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: _viewModel.state.recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = _viewModel.state.recipes[index];
                    return RecipeCard(recipe: recipe);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
