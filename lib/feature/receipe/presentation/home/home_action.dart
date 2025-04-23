sealed class HomeAction {
  const factory HomeAction.getRecipes() = GetRecipes;
  const factory HomeAction.sortRecipes(String text) = SortRecipes;
  const factory HomeAction.bookmarkTap(int id) = BookmarkTap;
}

class GetRecipes implements HomeAction {
  const GetRecipes();
}

class SortRecipes implements HomeAction {
  final String text;
  const SortRecipes(this.text);
}

class BookmarkTap implements HomeAction {
  final int id;
  const BookmarkTap(this.id);
}
