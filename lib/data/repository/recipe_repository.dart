// lib/domain/repository/recipe_repository.dart
import 'package:recipe_app/data/model/recipe_model.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getRecipes();
}