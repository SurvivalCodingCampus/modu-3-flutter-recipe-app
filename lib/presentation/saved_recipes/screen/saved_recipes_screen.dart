import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/recipe_card.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SavedRecipeScreen extends StatelessWidget {
  final List<Recipe> recipes;
  final VoidCallback onBookmarkClick;

  const SavedRecipeScreen({
    super.key,
    required this.recipes,
    required this.onBookmarkClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Recipes', style: AppTextStyles.mediumBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return RecipeCard(
              onBookmarkClick: onBookmarkClick,
              recipe: recipes[index],
            );
          },
          itemCount: recipes.length,
        ),
      ),
    );
  }
}
