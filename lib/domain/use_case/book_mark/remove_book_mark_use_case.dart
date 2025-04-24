import 'package:recipe_app/domain/repository/book_mark_repository.dart';

class RemoveBookMarkUseCase {
  final BookMarkRepository _repository;

  RemoveBookMarkUseCase({required BookMarkRepository repository})
    : _repository = repository;

  Future<void> execute(int recipeId) async {
    await _repository.removeBookMark(recipeId);
  }
}
