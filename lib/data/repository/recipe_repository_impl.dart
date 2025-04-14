import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/mapper/recipe_mapper.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

import '../data_source/mock_recipe_data_source_impl.dart';
import '../dto/recipe_dto.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  const RecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
  }) : _recipeDataSource = recipeDataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    final List<RecipeDto> recipeDtos = await _recipeDataSource.getRecipeDtos();
    return recipeDtos.map((e) => e.toRecipe()).toList();
  }
}

void main() async {
  final RecipeDataSource recipeDataSource = MockRecipeDataSourceImpl();
  final RecipeRepository recipeRepository = RecipeRepositoryImpl(recipeDataSource: recipeDataSource);

  List<Recipe> recipes = await recipeRepository.getRecipes();

  print(recipes.first);
}