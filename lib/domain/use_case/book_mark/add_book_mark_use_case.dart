import 'package:recipe_app/domain/repository/book_mark_repository.dart';

class AddBookMarkUseCase {
  final BookMarkRepository _repository;

  AddBookMarkUseCase({required BookMarkRepository repository})
    : _repository = repository;

  Future<void> execute(int recipeId) async {
    await _repository.addBookMark(recipeId);
  }
}
