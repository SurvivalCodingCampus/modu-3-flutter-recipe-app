import 'package:flutter/material.dart';
import 'package:recipe_app/core/modules/state/state_handling.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/feature/receipe/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/feature/receipe/domain/data_source/home/mock/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/presentation/pages/base/base_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/home/home_view_model.dart';
import 'package:recipe_app/presentation/widgets/recipe/recipe_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = HomeViewModel(
      RecipeRepositoryImpl(MockRecipeDataSourceImpl()),
    );
    return BaseScreen(
      appBar: AppBar(
        title: const Text('Saved recipes'),
        backgroundColor: AppColor.white,
      ),
      child: ListenableBuilder(
        listenable: viewModel..fetchRecipes(),
        builder: (context, child) {
          final viewState = viewModel.state.viewState;
          final recipes = viewModel.state.data;

          return StateHandling(
            viewState,
            complete: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return RecipeCard.fromModel(recipe);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 20);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
