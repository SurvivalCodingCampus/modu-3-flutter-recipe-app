import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/recipe_app/ui/text_styles2.dart';

import 'saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel savedRecipesViewModel;

  const SavedRecipesScreen({super.key, required this.savedRecipesViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved recipes', style: TextStyles2.savedRecipesText),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: ListenableBuilder(
          listenable: savedRecipesViewModel,
          builder: (context, child) {
            if (savedRecipesViewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (savedRecipesViewModel.recipes.isEmpty) {
              return const Center(child: Text('저장된 레시피가 없습니다.'));
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: savedRecipesViewModel.recipes[index],
                  showTimerAndBookmark: true,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: savedRecipesViewModel.recipes.length,
            );
          },
        ),
      ),
    );
  }
}
