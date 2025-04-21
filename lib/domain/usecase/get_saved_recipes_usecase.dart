
// lib/domain/usecase/get_saved_recipes_usecase.dart
import 'package:recipe_app/domain/entity/recipe_model.dart';

abstract class GetSavedRecipesUseCase {
  Future<List<Recipe>> execute();
}
