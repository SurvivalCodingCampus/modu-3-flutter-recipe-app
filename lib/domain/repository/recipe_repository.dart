import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/base_repository.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

abstract interface class RecipeRepository
    implements BaseRepository<Recipe, RecipeErrorEnum> {
  Future<Result<Recipe, RecipeErrorEnum>> findRcipeById(int id);
}
