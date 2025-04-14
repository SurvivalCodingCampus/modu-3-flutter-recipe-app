import 'package:flutter/material.dart';
import 'package:recipe_app/data/mocks/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/util/ui_state.dart';

class SavedRecipesScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  factory SavedRecipesScreen.withMock() {
    return SavedRecipesScreen(
      viewModel: SavedRecipesViewModel(
        RecipeRepositoryImpl(
          remoteDataSource: null,
          localDataSource: MockRecipeDataSourceImpl(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final state = viewModel.state;

        return Scaffold(
          appBar: AppBar(title: const Text('Saved recipes')),
          body: switch (state) {
            UiLoading() => const Center(child: CircularProgressIndicator()),

            UiSuccess(data: final recipes) => ListView.separated(
              itemCount: recipes.length,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return RecipeCard(
                  title: recipe.name,
                  imagePath: recipe.image,
                  cookTime: recipe.time,
                  authorName: recipe.chef,
                  rating: recipe.rating,
                  isFavorite: true,
                  onTap: () {
                    debugPrint('지금은 없어~~');
                  },
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 12),
            ),

            UiEmpty() => const Center(child: Text('저장된 레시피가 없습니다.')),

            UiError(message: final msg) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('에러 발생: $msg'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: viewModel.load,
                    child: const Text('다시 시도'),
                  ),
                ],
              ),
            ),
          },
        );
      },
    );
  }
}
