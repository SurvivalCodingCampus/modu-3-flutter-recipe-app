import 'package:recipe_app/domain/model/book_mark/book_mark.dart';

abstract interface class BookMarkRepository {
  Future<BookMark> getSavedRecipe(int id);
}
