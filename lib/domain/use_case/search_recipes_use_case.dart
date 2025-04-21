import 'package:recipe_app/core/result.dart';
import 'package:recipe_app/domain/error/recipe_error.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;
  List<Recipe> _recentRecipes = [];

  SearchRecipesUseCase(this._recipeRepository);

  List<Recipe> get recentRecipes => _recentRecipes;

  Future<Result<List<Recipe>, RecipeError>> execute(
    String query,
    int rating,
  ) async {
    Result<List<Recipe>, RecipeError> recipes = await _recipeRepository
        .findAllByFilter(
          (e) =>
              e.name.toLowerCase().contains(query.toLowerCase()) &&
              e.rating >= rating,
        );

    switch (recipes) {
      case Success(:final List<Recipe> data):
        final merged = [..._recentRecipes, ...data];

        final deduplicated =
            {for (var recipe in merged) recipe.id: recipe}.values.toList();

        _recentRecipes =
            deduplicated.length > 8
                ? deduplicated.sublist(deduplicated.length - 8)
                : deduplicated;

        return recipes;
      case Failure(:final error):
        return Failure(error);
    }
  }
}
