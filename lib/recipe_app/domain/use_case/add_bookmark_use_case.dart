import 'package:recipe_app/recipe_app/data/model/recipe.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository.dart';

class AddBookmarkUseCase {
  final BookMarkRepository bookMarkRepository;

  AddBookmarkUseCase(this.bookMarkRepository);

  void execute(Recipe recipe) {
    bookMarkRepository.addBookMark(recipe);
  }
}
