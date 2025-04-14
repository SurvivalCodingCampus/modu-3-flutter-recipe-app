import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/skeleton_effect.dart';
import 'package:recipe_app/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/screen/saved_recipes/skeleton_card.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

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
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            if (viewModel.isLoading) {
              return ListView.builder(
                itemCount: 5, // 임시로 5개 데이터
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: const SkeletonEffect(
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
              );
            }

            if (viewModel.savedRecipes.isEmpty) {
              return Center(
                child: Text(
                  '저장된 레시피가 없습니다.',
                  style: AppTextStyles.mediumBold(),
                ),
              );
            }

            return ListView.builder(
              itemCount: viewModel.savedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = viewModel.savedRecipes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RecipeCard(recipe: recipe),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
