import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/interface/ingredient_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_ingredient_data_source.dart';
import 'package:recipe_app/domain/model/ingredient.dart';

void main() {
  final IngredientDataSource dataSource = MockIngredientDataSource();

  test('Ingredient를 배열 형태로 반환해야한다.', () async {
    final List<Ingredient> ingredients = await dataSource.fetch();

    expect(ingredients, isA<List<Ingredient>>());
    expect(ingredients, isNotEmpty);
  });
}
