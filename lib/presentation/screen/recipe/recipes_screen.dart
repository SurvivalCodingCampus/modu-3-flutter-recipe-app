import 'package:flutter/material.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/presentation/screen/recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/widget/recipe_card.dart'; // 카드 위젯

class RecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const RecipesScreen({super.key, required this.viewModel});

  // ✅ 숫자만 추출하는 헬퍼 함수
  int _extractMinutes(String time) {
    final match = RegExp(r'\d+').firstMatch(time);
    return match != null ? int.parse(match.group(0)!) : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Saved Recipes',
          style: AppTextStyles.mediumBold(color: Colors.black),
        ),
      ),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          final state = viewModel.state;

          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final recipes = state.filteredRecipes;

          if (recipes.isEmpty) {
            return const Center(child: Text("저장된 레시피가 없습니다."));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final uiModel = recipes[index];
              final recipe = uiModel.recipe;

              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: RecipeCard(
                  recipeName: recipe.name,
                  chefName: recipe.chef,
                  recipeImgUrl: recipe.image,
                  recipeTime: _extractMinutes(recipe.time),
                  recipeRating: recipe.rating,
                  isBookmarked: uiModel.isBookmarked,
                  onBookmarkTap: () async {
                    await viewModel.toggleBookmark(recipe);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
