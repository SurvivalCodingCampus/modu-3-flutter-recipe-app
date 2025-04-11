import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/interface/repository.dart';

abstract interface class RecipeRepository implements Repository<Recipe, int> {}
