import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved recipes', style: TextStyles.mediumBold()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListenableBuilder(
            listenable: viewModel,
            builder: (context, snapshot) {
              if (viewModel.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children:
                    viewModel.recipes.isEmpty
                        ? [
                          const SizedBox(height: 40),
                          const Text('저장된 레시피가 없습니다.'),
                        ]
                        : viewModel.recipes
                            .map(
                              (recipe) => Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: RecipeCard(
                                  recipe: recipe,
                                  isBookmarked: viewModel.user.bookmarks
                                      .contains(recipe.id),
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
