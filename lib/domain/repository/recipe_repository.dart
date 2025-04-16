import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/repository.dart';

abstract interface class RecipeRepository implements Repository<Recipe, int> {}
