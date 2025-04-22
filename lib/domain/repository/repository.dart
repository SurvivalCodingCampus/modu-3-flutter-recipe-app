import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';

abstract interface class Repository<T, ID> {
  Future<Result<T, RecipeError>> findById(ID id);
  Future<Result<List<T>, RecipeError>> findAll();
  Future<Result<List<T>, RecipeError>> findAllByFilter(
    bool Function(T predicate) predicate,
  );
}
