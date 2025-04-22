sealed class RecipeInfoAction {
  const factory RecipeInfoAction.getRecipeInfo(int id) = GetRecipeInfo;
}

class GetRecipeInfo implements RecipeInfoAction {
  final int id;
  const GetRecipeInfo(this.id);
}
