import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

void main() {
  final RecipeDataSource dataSource = MockRecipeDataSource();
  final RecipeRepository repository = RecipeRepositoryImpl(dataSource);
  final GetSavedRecipesUseCase getSavedRecipesUseCase = GetSavedRecipesUseCase(
    repository,
  );
  final SavedRecipesViewModel viewModel = SavedRecipesViewModel(
    getSavedRecipesUseCase,
  );

  test('fetchAll 호출 시 레시피 목록을 가져와야한다.', () async {
    await viewModel.fetchAll();

    expect(viewModel.state.recipes, isNotEmpty);
    expect(viewModel.state.recipes[0].name, 'Traditional spare ribs baked');
  });
}
