import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/presentation/home/saved_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel savedRecipesViewModelviewModel;

  const SavedRecipesScreen({
    super.key,
    required this.savedRecipesViewModelviewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved recipes', style: TextStyles2.savedRecipesText),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ListenableBuilder(
          listenable: savedRecipesViewModelviewModel,
          builder: (context, child) {
            if (savedRecipesViewModelviewModel.isLoading) {
              return CircularProgressIndicator();
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: savedRecipesViewModelviewModel.recipes[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: savedRecipesViewModelviewModel.recipes.length,
            );
          },
        ),
      ),
    );
  }
}
