import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';

import '../../../lib/data/mocks/mock_recipe_data_source_impl.dart';

void main() {
  group('MockRecipeDataSourceImpl', () {
    late RecipeDataSource dataSource;

    setUp(() {
      dataSource = MockRecipeDataSourceImpl(
        filePath: 'test/fixtures/recipes.json',
      );
    });

    test('fetchRecipes should return full recipe summaries', () async {
      final recipes = await dataSource.fetchRecipes();

      expect(recipes, isA<List<RecipeDto>>());
      expect(recipes.length, greaterThan(0));

      debugPrint('📋 전체 레시피 요약 (${recipes.length}개):\n');

      for (final recipe in recipes) {
        final ingredientList =
            recipe.ingredients
                ?.map((e) {
                  final name = e.ingredient?.name ?? 'Unknown';
                  final amount = e.amount?.toInt() ?? 0;
                  return '$name ${amount}g';
                })
                .join(', ') ??
            'Unknown';

        debugPrint(
          '${recipe.id}: ${recipe.name} (${recipe.category}) by ${recipe.chef} - [ $ingredientList ]',
        );
      }
    });
  });
}
