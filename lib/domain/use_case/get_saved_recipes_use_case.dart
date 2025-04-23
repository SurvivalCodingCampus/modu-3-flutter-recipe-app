import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/model/user.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

class GetSavedRecipesUseCase {
  final RecipeRepository _recipeRepository;
  final UserRepository _userRepository;
  

  GetSavedRecipesUseCase({
    required RecipeRepository recipeRepository,
    required UserRepository userRepository,
    required BookmarkRepository bookmarkRepository,
  }) : _recipeRepository = recipeRepository,
       _userRepository = userRepository;



  Future<List<Recipe>> excute() async {
    final recipes = await _recipeRepository.getRecipes();
    final userModel = await _userRepository.getUserData(4);
    final result =
        recipes
            .where((e) => userModel.bookMarkList.contains(e.recipeId))
            .toList();
    // print("조건에 맞는 레시피들을 가져온 결과 : ${result.map((e) => e.recipeId)}");
    return result;
  }

}
