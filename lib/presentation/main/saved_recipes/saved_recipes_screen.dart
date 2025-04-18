import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_view_model.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved recipes', style: TextStyles.mediumBold()),
        centerTitle: true,
        backgroundColor: ColorStyles.white,
      ),
      backgroundColor: ColorStyles.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListenableBuilder(
            listenable: viewModel..fetchSavedRecipes(),
            builder: (context, snapshot) {
              if (viewModel.state.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children:
                    viewModel.state.recipes.isEmpty
                        ? [
                          const SizedBox(height: 40),
                          const Text('저장된 레시피가 없습니다.'),
                        ]
                        : viewModel.state.recipes
                            .map(
                              (recipe) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: RecipeCard(
                                  showTitle: true,
                                  recipe: recipe,
                                  isBookmarked: true,
                                  onClick: (int id) {
                                    context.push(Routes.ingredient.replaceAll(':recipeId', id.toString()));
                                  },
                                  onBookmark: (int id) {
                                    viewModel.toggleBookmark(id);
                                  },
                                ),
                              ),
                            )
                            .toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
