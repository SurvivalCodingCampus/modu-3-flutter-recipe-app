import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/mocks/mock_recipe_data_source_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('MockRecipeDataSourceImpl', () {
    late RecipeDataSource dataSource;

    setUp(() {
      dataSource = MockRecipeDataSourceImpl();
    });

    test('fetchRecipes 테스트', () async {
      final recipes = await dataSource.fetchRecipes();

      expect(recipes, isA<List<RecipeDto>>());
      expect(recipes.length, greaterThan(0));

      debugPrint('📋 전체 레시피 요약 (${recipes.length}개):\n');

      // 첫번째 레시피 검증
      final firstRecipe = recipes.first;
      expect(firstRecipe.id, isNotNull);
      expect(firstRecipe.name, isNotNull);
      expect(firstRecipe.category, isNotNull);

      if (firstRecipe.ingredients != null &&
          firstRecipe.ingredients!.isNotEmpty) {
        final firstIngredient = firstRecipe.ingredients!.first;
        expect(firstIngredient.ingredient, isNotNull);
        expect(firstIngredient.amount, isA<num>());
      }

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
