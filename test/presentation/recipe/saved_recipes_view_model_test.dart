import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:recipe_app/data/repository/interface/recipe_repository.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/recipe/saved_recipes_view_model.dart';

void main() {
  final RecipeDataSource dataSource = MockRecipeDataSource();
  final RecipeRepository repository = RecipeRepositoryImpl(dataSource);
  final SavedRecipesViewModel viewModel = SavedRecipesViewModel(repository);

  test('fetchAll 호출 시 레시피 목록을 가져와야한다.', () async {
    await viewModel.fetchAll();

    expect(viewModel.recipes, isNotEmpty);
    expect(viewModel.recipes[0].name, 'Traditional spare ribs baked');
  });
}
