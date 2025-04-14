import 'package:recipe_app/data_source/recipes/recipe_data_source.dart';
import 'package:recipe_app/dto/recipes/recipes_dto.dart';
import 'package:recipe_app/mapper/recipes/recipes_mapper.dart';
import 'package:recipe_app/model/recipe/recipe.dart';
import 'package:recipe_app/repository/recipes/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource dataSource;

  const RecipeRepositoryImpl({required this.dataSource});

  @override
  Future<List<Recipe>> getSaveRecipeList() async {
    final Map<String, dynamic> response = await dataSource.getRecipes();
    List<Recipes> saveRecipes = [];
    response["recipes"].map((Map<String, dynamic> item) {
      saveRecipes.add(Recipes.fromJson(item));
    }).toList();

    return saveRecipes.map((recipe) => recipe.toRecipe()).toList();
  }
}
