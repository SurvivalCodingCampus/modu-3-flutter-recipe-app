import 'package:recipe_app/domain/model/chef.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/chef_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class SearchChefByRecipeChef {
  final ChefRepository _chefRepository;
  final RecipeRepository _recipeRepository;

  const SearchChefByRecipeChef({
    required ChefRepository chefRepository,
    required RecipeRepository recipeRepository,
  }) : _chefRepository = chefRepository,
       _recipeRepository = recipeRepository;

  Future<Chef> execute(int recipeId) async {
    final Recipe recipe = await _recipeRepository.getRecipe(recipeId);
    final List<Chef> chefs = await _chefRepository.getChefs();
    return chefs.firstWhere((chef) => chef.name == recipe.chef);
  }
}