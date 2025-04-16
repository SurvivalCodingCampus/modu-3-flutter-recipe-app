import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository.dart';

class ToggleBookmarkUseCase {
  final BookMarkRepository bookMarkRepository;

  ToggleBookmarkUseCase(this.bookMarkRepository);

  void execute(int id) {
    bookMarkRepository.toggleBookMark(id);
  }
}
