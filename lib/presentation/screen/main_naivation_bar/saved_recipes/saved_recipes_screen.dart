import 'package:flutter/material.dart';
import 'package:recipe_app/core/component/recipe_card.dart';
import 'package:recipe_app/core/component/skeleton_effect.dart';
import 'package:recipe_app/presentation/screen/main_naivation_bar/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/core/ui_styles/color_styles.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchSavedRecipe(); // 최초 1회만 호출
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        surfaceTintColor: ColorStyle.white,
        backgroundColor: ColorStyle.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Saved recipe',
          style: AppTextStyles.mediumBold(color: ColorStyle.label),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, child) {
            if (widget.viewModel.state.isLoading) {
              return ListView.builder(
                itemCount: 5,
                itemBuilder:
                    (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: SkeletonEffect(
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
              );
            }

            if (widget.viewModel.state.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  widget.viewModel.state.errorMessage,
                  style: AppTextStyles.mediumBold(),
                ),
              );
            }

            return ListView.builder(
              itemCount: widget.viewModel.state.savedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = widget.viewModel.state.savedRecipes[index];
                widget.viewModel.setRecipeCardState(recipe);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RecipeCard(
                    recipe: recipe,
                    onBookMarkTap: () {
                      widget.viewModel.removeToggle(recipe.recipeId);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
