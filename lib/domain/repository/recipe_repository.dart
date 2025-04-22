import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/recipe_info.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';
import 'package:recipe_app/domain/model/type/rate_type.dart';
import 'package:recipe_app/domain/model/type/time_filter_type.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getSavedRecipes({
    String query = '',
    TimeFilterType? timeFilterType,
    RateType? rateType,
    CategoryFilterType? categoryFilterType,
  });


  Future<RecipeInfo> getRecipesInfo({required String id});

  Future<void> saveRecentRecipes(List<Recipe> recipes);

  Future<List<Recipe>> getSavedRecentRecipes();
}