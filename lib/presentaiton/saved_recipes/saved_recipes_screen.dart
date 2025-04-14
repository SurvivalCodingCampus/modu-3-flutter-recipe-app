import 'package:flutter/material.dart';
import 'package:recipe_app/presentaiton/component/recipe_card.dart';
import 'package:recipe_app/presentaiton/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentaiton/ui/text_styles.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel savedRecipesViewModel;

  const SavedRecipesScreen({super.key, required this.savedRecipesViewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.savedRecipesViewModel.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.savedRecipesViewModel,
      builder: (context, child) {
        return Scaffold(
          body: ListView.builder(
            itemCount: widget.savedRecipesViewModel.recipes.length,
            itemBuilder: (context, index) {
              final recipe = widget.savedRecipesViewModel.recipes[index];
              return RecipeCard(recipe: recipe);
            },
          ),
        );
      },
    );
  }
}
