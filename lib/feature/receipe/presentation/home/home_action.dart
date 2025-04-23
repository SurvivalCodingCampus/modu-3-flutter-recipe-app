sealed class HomeAction {
  const factory HomeAction.getRecipes() = GetRecipes;
  const factory HomeAction.sortRecipes(String text) = SortRecipes;
}

class GetRecipes implements HomeAction {
  const GetRecipes();
}

class SortRecipes implements HomeAction {
  final String text;
  const SortRecipes(this.text);
}
