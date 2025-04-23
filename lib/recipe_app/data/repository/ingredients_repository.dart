import 'package:recipe_app/recipe_app/data/model/ingredient.dart';

abstract class IngredientsRepository{
  Future<List<Ingredient>> getIngredients();
}