import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/text_style.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;
  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Saved recipes", style: TextStyles.mediumTextBold),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 24),
                    if (viewModel.isLoading)
                      const Center(child: CircularProgressIndicator()),
                    if (!viewModel.isLoading && viewModel.recipes.isEmpty)
                      const Center(child: Text("저장된 레시피가 없습니다.")),
                    for (final recipe in viewModel.recipes) ...[
                      RecipeCard(recipe: recipe, isBig: true,),
                      SizedBox(height: 24),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
