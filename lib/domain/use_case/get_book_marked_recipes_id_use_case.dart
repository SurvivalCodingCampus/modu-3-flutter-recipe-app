import 'package:recipe_app/domain/roepositpry/book_mark_repository.dart';

class GetBookMarkedRecipesIdUseCase {
  final BookMarkRepository _bookMarkRepository;

  GetBookMarkedRecipesIdUseCase(this._bookMarkRepository);

  Future<List<int>> execute(int userId) async {
    final bookMark = await _bookMarkRepository.getSavedRecipe(userId);
    return bookMark.bookMarkedRecipesId;
  }
}
