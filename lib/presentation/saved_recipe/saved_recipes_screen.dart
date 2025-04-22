import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';
import 'package:recipe_app/presentation/components/f_recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel savedRecipesViewModel;

  const SavedRecipesScreen({super.key, required this.savedRecipesViewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.savedRecipesViewModel,
        builder: (context, snapshot) {
          if (widget.savedRecipesViewModel.state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (widget.savedRecipesViewModel.state.savedRecipes.isEmpty) {
            return Center(
              child: Text(
                '저장된 레시피가 없습니다',
                style: TextStyles.mediumTextRegular(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return _buildBody();
          }
        },
      ),
    );
  }

  SafeArea _buildBody() {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Text(
              'Saved recipes',
              style: TextStyles.mediumTextBold(color: AppColors.black),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 30),
                itemCount:
                    widget.savedRecipesViewModel.state.savedRecipes.length,
                itemBuilder: (context, index) {
                  final recipe =
                      widget.savedRecipesViewModel.state.savedRecipes[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        final basePath = Routes.ingredient.split('/:')[0];
                        context.push('$basePath/${recipe.id}');
                      },
                      child: FRecipeCard(
                        recipe: recipe,
                        onToggleFavorite: (id) {
                          widget.savedRecipesViewModel.toggleFavorite(
                            recipe.id,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
