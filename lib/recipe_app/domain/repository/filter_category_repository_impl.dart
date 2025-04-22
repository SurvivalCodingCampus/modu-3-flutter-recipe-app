import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';
import 'package:recipe_app/recipe_app/domain/repository/filter_category_repository.dart';

class FilterCategoryRepositoryImpl implements FilterCategoryRepository {
  final RecipeDataSource _recipeDataSource;

  FilterCategoryRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> filterRecipesByCategory(
    int? time,
    int? rate,
    String? category,
  ) async {
    final recipeList = await _recipeDataSource.getRecipeData();

    final recipesByCategory =
        recipeList.where((e) {
          final matchesRate = rate == null || e.rate.toInt() == rate;
          final matchesCategory =
              category == null ||
              e.category.toLowerCase() == category.toLowerCase();
          final matchesTime =
              time == null || time == 'All' || e.time.toInt() == time.toInt();

          return matchesRate && matchesCategory && matchesTime;
        }).toList();

    return recipesByCategory;
  }
}
