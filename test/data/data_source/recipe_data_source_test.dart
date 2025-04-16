import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';

void main() {
  final RecipeDataSource dataSource = MockRecipeDataSource();

  test('Recipe를 배열 형태로 반환해야한다.', () async {
    final List<Recipe> recipes = await dataSource.fetch();

    expect(recipes, isA<List<Recipe>>());
    expect(recipes, isNotEmpty);
  });
}
