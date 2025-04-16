import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';

class GetSavedRecipesUseCase {
  final BookmarkRepository _bookmarkRepository;

  const GetSavedRecipesUseCase(this._bookmarkRepository);

  Future<List<Recipe>> execute() async {
    return _bookmarkRepository.findAll();
  }
}
