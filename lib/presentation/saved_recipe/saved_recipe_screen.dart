import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:recipe_app/presentation/bookmark_recipe/bookmark_repository_impl.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipe/get_saved_recipe_use_case.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipe_view_model.dart';

void main() {
  final dts = RecipeDataSourceImpl();
  final rp = BookmarkRepositoryImpl(dts);
  final uc = GetSavedRecipeUseCase(rp);
  final viewModel = SavedRecipeViewModel(uc);

  runApp(
    MaterialApp(home: Scaffold(body: SavedRecipeScreen(viewModel: viewModel))),
  );
}

class SavedRecipeScreen extends StatelessWidget {
  final SavedRecipeViewModel viewModel;

  SavedRecipeScreen({super.key, required this.viewModel}) {
    viewModel.fetchSavedRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.isLoading) {
          return Scaffold(
            appBar: AppBar(title: Text('Saved recipes'), centerTitle: true),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text('Saved recipes'), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return RecipeCard(recipe: viewModel.recipes[index], viewModel: viewModel,);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 1);
              },
              itemCount: viewModel.recipes.length,
            ),
          ),
        );
      },
    );
  }
}
