import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository.dart';

class GetSavedRecipesUseCase {
  final BookMarkRepository _bookMarkRepository;

  GetSavedRecipesUseCase({required BookMarkRepository bookMarkRepository})
    : _bookMarkRepository = bookMarkRepository;

  Future<List<Recipe>> execute() async {
    await _bookMarkRepository.initializeBookmarks();
    return await _bookMarkRepository.getBookMarkedRecipes();
  }
}
