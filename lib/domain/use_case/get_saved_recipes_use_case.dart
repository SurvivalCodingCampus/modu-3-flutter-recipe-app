import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

import '../model/recipe.dart';

class GetSavedRecipesUseCase {
  final UserRepository _userRepository;
  final RecipeRepository _recipeRepository;

  const GetSavedRecipesUseCase({
    required UserRepository userRepository,
    required RecipeRepository recipeRepository,
  }) : _userRepository = userRepository,
       _recipeRepository = recipeRepository;

  Future<List<Recipe>> execute() async {
    final user = await _userRepository.getUser();
    return await _recipeRepository.getRecipesByUser(user.id);
  }
}
