import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/utils/errors/recipe_error_enum.dart';
import 'package:recipe_app/utils/result/result.dart';

class GetSavedRecipesUseCase {
  final BookmarkRepository _bookmarkRepository;
  final RecipeRepository _recipeRepository;

  const GetSavedRecipesUseCase(
    this._bookmarkRepository,
    this._recipeRepository,
  );

  BookmarkRepository get bookmarkRepository => _bookmarkRepository;

  Future<Result<List<Recipe>, RecipeErrorEnum>> execute() async {
    try {
      final ids = await _bookmarkRepository.getBookmarkIds();
      final result = await _recipeRepository.findDatas();

      switch (result) {
        case Success<List<Recipe>, RecipeErrorEnum>():
          return Result.success(
            result.success.where((recipe) => ids.contains(recipe.id)).toList(),
          );
        case Error<List<Recipe>, RecipeErrorEnum>():
          return const Result.error(RecipeErrorEnum.networkerror);
      }
    } on RecipeErrorEnum {
      return const Result.error(RecipeErrorEnum.networkerror);
    }
  }
}
