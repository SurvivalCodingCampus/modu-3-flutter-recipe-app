import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/base_repository.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';

abstract interface class RecipeRepository
    implements BaseRepository<Recipe, RecipeErrorEnum> {}
