import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/usecase/unbookmark_recipe_usecase.dart';

class UnbookmarkRecipeUseCaseImpl implements UnbookmarkRecipeUseCase {
  final BookmarkRepository _bookmarkRepository;

  UnbookmarkRecipeUseCaseImpl(this._bookmarkRepository);

  @override
  Future<void> execute(int recipeId) async {
    await _bookmarkRepository.removeRecipe(recipeId);
  }
}
