import 'package:flutter/material.dart';
import 'package:recipe_app/core/ui/color_styles.dart';
import 'package:recipe_app/core/ui/text_styles.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_action.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_state.dart';

class SavedRecipesScreen extends StatelessWidget {
  final void Function(SavedRecipesAction action) onAction;
  final SavedRecipesState state;

  const SavedRecipesScreen({
    super.key,
    required this.state,
    required this.onAction,
  });

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
          child: Column(
            children:
                state.recipes.isEmpty
                    ? [const SizedBox(height: 40), const Text('저장된 레시피가 없습니다.')]
                    : state.recipes
                        .map(
                          (recipe) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RecipeCard(
                              showTitle: true,
                              recipe: recipe,
                              isBookmarked: true,
                              onClick: (int id) {
                                onAction(SavedRecipesAction.onRecipeClick(id));
                              },
                              onBookmark: (int id) {
                                onAction(SavedRecipesAction.onBookmark(id));
                              },
                            ),
                          ),
                        )
                        .toList(),
          ),
        ),
      ),
    );
  }
}
