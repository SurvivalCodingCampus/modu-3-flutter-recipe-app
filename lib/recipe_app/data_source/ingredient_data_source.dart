import 'package:recipe_app/recipe_app/data/model/ingredient.dart';

abstract interface class IngredientDataSource {
  Future<List<Ingredient>> getIngredientData();
}
