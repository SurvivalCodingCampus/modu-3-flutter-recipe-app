import 'package:recipe_app/data/dto/book_mark_dto.dart';
import 'package:recipe_app/domain/model/book_mark/book_mark.dart';

extension BookMarkMepper on BookMarkDto {
  BookMark toBookMark() {
    List<int> bookmarkedRecipeIds =
        bookmarkedRecipes.map((recipe) => recipe.recipeId).toList();
    return BookMark(id: userId, bookMarkedRecipesId: bookmarkedRecipeIds);
  }
}
