import 'package:recipe_app/domain/model/model.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}
