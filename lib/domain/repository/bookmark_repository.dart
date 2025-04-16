import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/repository.dart';

abstract interface class BookmarkRepository implements Repository<Recipe, int> {
  Future<void> init();
  Future<void> add(Recipe recipe);
  Future<void> remove(int id);
}
