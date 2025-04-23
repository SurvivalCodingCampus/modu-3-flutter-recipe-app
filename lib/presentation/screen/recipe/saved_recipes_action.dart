import 'package:recipe_app/domain/entity/recipe_model.dart';

sealed class SavedRecipesAction {}

class ToggleBookmark extends SavedRecipesAction {
  final Recipe recipe;
  ToggleBookmark(this.recipe);
}

class UpdateSearchQuery extends SavedRecipesAction {
  final String query;
  UpdateSearchQuery(this.query);
}

class RefreshRecipes extends SavedRecipesAction {}
