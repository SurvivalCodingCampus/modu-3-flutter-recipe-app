import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/domain/repository/select_category_repository.dart';

import '../../data_source/recipe_data_source.dart';

class SelectCategoryRepositoryImpl implements SelectCategoryRepository {
  final RecipeDataSource _recipeDataSource;

  SelectCategoryRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  // All일때 모든 레시피 반환
  @override
  Future<List<Recipe>> selectCategoryRecipes(String category) async {
    final recipeList = await _recipeDataSource.getRecipeData();
    if (category.toLowerCase() == 'all') {
      print('All Category Recipes: $recipeList');
      print('선택된 카테고리: $category');
      return recipeList;
    }
    final categoryRecipes =
        recipeList.where((e) => e.category == category).toList();

    print('Filtered [$category] Recipes: $categoryRecipes');
    return categoryRecipes;
  }
}
