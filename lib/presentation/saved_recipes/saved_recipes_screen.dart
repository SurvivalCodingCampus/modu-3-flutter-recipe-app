import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_font_style.dart';

class SavedRecipesScreen extends StatelessWidget {
  final List<Recipe> _recipe;
  const SavedRecipesScreen({super.key, required List<Recipe> recipe})
    : _recipe = recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorStyle.primary20,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: Text('Saved Recipes', style: TextFontStyle.mediumBold()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _recipe.length,
              itemBuilder: (context, index) {
                final recipe = _recipe[index];
                return RecipeCard(recipe: recipe);
              },
            ),
          ),
        ],
      ),
    );
  }
}
