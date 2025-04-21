import 'package:recipe_app/domain/repository/book_mark_repository.dart';

class GetBookMarkedRecipesIdUseCase {
  final BookMarkRepository _repository;

  GetBookMarkedRecipesIdUseCase({required BookMarkRepository repository})
    : _repository = repository;
  Future<List<int>> execute(int userId) async {
    final bookMark = await _repository.getSavedRecipe(userId);
    return bookMark.bookMarkedRecipesId;
  }
}
