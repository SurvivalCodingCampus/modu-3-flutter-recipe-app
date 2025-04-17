import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository.dart';

class RemoveBookmarkUseCase {
  final BookMarkRepository _bookMarkRepository;

  RemoveBookmarkUseCase({required BookMarkRepository bookMarkRepository})
    : _bookMarkRepository = bookMarkRepository;

  void execute(int id) {
    _bookMarkRepository.removeBookMark(id);
  }
}
