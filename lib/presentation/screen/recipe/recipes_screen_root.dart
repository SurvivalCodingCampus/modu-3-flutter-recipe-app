import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/app/routing/router_path.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/presentation/screen/recipe/recipes_screen.dart';
import 'package:recipe_app/presentation/screen/recipe/saved_recipes_view_model.dart';

class RecipesScreenRoot extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const RecipesScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewModel.init(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Saved recipes',
              style: AppTextStyles.mediumBold(color: Colors.black),
            ),
          ),
          body: ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              return RecipesScreen(
                state: viewModel.state,
                onBookmarkToggle: viewModel.toggleBookmark,
                onTapRecipe: (recipe) {
                  context.push(RouterPath.ingredient, extra: recipe);
                },
              );
            },
          ),
        );
      },
    );
  }
}
