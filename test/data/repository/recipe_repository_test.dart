import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

void main() {
  final RecipeDataSource dataSource = MockRecipeDataSource();
  final RecipeRepository repository = RecipeRepositoryImpl(dataSource);

  test('findAll 호출 시 Recipe를 리스트 형태로 반환해야한다.', () async {
    final List<Recipe> recipes = await repository.findAll();

    expect(recipes, isA<List<Recipe>>());
    expect(recipes, isNotEmpty);
  });
}
