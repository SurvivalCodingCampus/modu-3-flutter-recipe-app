import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

import '../../data/model/recipe.dart' show Recipe;
import '../component/recipe_card.dart';
import '../ui/color_styles.dart';
import '../ui/text_styles.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        title: Text('Saved recipes', style: AppTextStyles.mediumBold),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListenableBuilder(
          listenable: viewModel..fetchRecipes(),
          builder: (context, child) {
          if (viewModel.state.isLoading) {
            return CircularProgressIndicator();
          }

          return ListView.separated(
            padding: EdgeInsets.all(30),
            itemCount: viewModel.state.recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(recipe: viewModel.state.recipes[index],
                  onBookmarkChanged: (isBookmarked) {
                    print('Bookmark changed: $isBookmarked');
                  }
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 20); // 간격!
            },
          );
        }
      ),
    );
  }
}
