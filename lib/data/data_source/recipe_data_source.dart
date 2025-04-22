import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/dto/recipe_info_dto.dart';
import 'package:recipe_app/domain/model/type/category_filter_type.dart';
import 'package:recipe_app/domain/model/type/rate_type.dart';
import 'package:recipe_app/domain/model/type/time_filter_type.dart';

abstract interface class RecipeDataSource {
  Future<List<RecipeDto>> fetchSavedRecipes({
    String query = '',
    TimeFilterType? timeFilterType,
    RateType? rateType,
    CategoryFilterType? categoryFilterType,
  });

  Future<RecipeInfoDto> fetchRecipeInfo({required String id});

  Future<RecipeDto> toggleFavorite(String id);
}
