import 'package:recipe_app/model/recipe.dart';

abstract interface class RecipeDataSource {
  List<Recipe> getRecipes();
}
