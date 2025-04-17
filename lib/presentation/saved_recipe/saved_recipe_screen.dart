import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

class SavedRecipeScreen extends StatefulWidget {
  final SavedRecipeViewModel viewModel;

  const SavedRecipeScreen({super.key, required this.viewModel});

  @override
  State<SavedRecipeScreen> createState() => _SavedRecipeScreenState();
}

class _SavedRecipeScreenState extends State<SavedRecipeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (BuildContext context, Widget? child) {
        if (widget.viewModel.state.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (widget.viewModel.state.savedRecipes.isEmpty) {
          return Center(child: Text('No saved recipes found.'));
        }
        return Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: ListView.builder(
            itemCount: widget.viewModel.state.savedRecipes.length,
            itemBuilder: (BuildContext context, int index) {
              final recipe = widget.viewModel.state.savedRecipes[index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  child: RecipeCard(
                    recipe: recipe,
                    showBookMarked: true,
                    showTitle: true,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
