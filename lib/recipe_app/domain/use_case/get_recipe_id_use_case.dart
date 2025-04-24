import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';

import '../../data/model/recipe.dart';

class GetRecipeIdUseCase {
  final RecipeRepository _repository;

  GetRecipeIdUseCase({required RecipeRepository repository})
    : _repository = repository;

  Future<Recipe> execute(int id) async {
    return await _repository.fetchRecipeById(id);
  }
}
