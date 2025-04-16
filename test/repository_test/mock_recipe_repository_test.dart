import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/data_source/mock_recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

void main() {
  test('MockRecipeRepository Test', () async {
    final RecipeDataSource mockRecipeDataSource = MockRecipeDataSource(
      client: http.Client(),
      url: 'testUrl',
    );
    final RecipeRepository mockRecipeRepository = MockRecipeRepositoryImpl(
      recipeDataSource: mockRecipeDataSource,
    );
    final recipeList = await mockRecipeRepository.getRecipes();
    print(recipeList);
  });
}
