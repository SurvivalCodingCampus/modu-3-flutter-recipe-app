import 'package:recipe_app/data/local_data_source.dart/local_data_source.dart';
import 'package:recipe_app/data/mapper/mapper.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/repository.dart';

class SearchRecipeRepositoryImpl implements SearchRecipeRepository {
  final LocalSearchRecipeDataSource _localSearchResultDataSource;

  SearchRecipeRepositoryImpl({
    required LocalSearchRecipeDataSource localSearchResultDataSource,
  }) : _localSearchResultDataSource = localSearchResultDataSource;

  @override
  Future<List<Recipe>> getRecipes() async {
    final response = await _localSearchResultDataSource.getRecipes();
    return response.map((e) => e.toRecipe()).toList();
  }

  @override
  Future<void> saveRecipes(List<Recipe> recipes) async {
    final datas = recipes.map((e) => e.toRecipeDto()).toList();
    await _localSearchResultDataSource.saveRecipes(datas);
  }
}
