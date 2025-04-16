import 'package:recipe_app/core/modules/error_handling/result.dart';
import 'package:recipe_app/feature/receipe/domain/model/recipe.dart';
import 'package:recipe_app/feature/receipe/domain/repository/info/recipe_info_repository.dart';

class GetRecipeInfoUseCase {
  final RecipeInfoRepository _recipeInfoRepository;

  GetRecipeInfoUseCase(this._recipeInfoRepository);

  Future<Result<Recipe>> execute(int id) async {
    final result = _recipeInfoRepository.getRecipeInfo(id);
    return result;
  }
}
