// lib/domain/usecase/get_saved_recipes_usecase_impl.dart
import 'package:recipe_app/domain/entity/recipe_model.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/usecase/get_saved_recipes_usecase.dart';

class GetSavedRecipesUseCaseImpl implements GetSavedRecipesUseCase {
  final RecipeRepository _repository;

  GetSavedRecipesUseCaseImpl(this._repository);

  @override
  Future<List<Recipe>> execute() async {
    return await _repository.getRecipes();
  }
}
