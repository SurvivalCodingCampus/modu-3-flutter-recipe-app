import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/interface/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  const RecipeRepositoryImpl(this._dataSource);

  @override
  Future<List<Recipe>> findAll() async {
    final recipes = await _dataSource.fetch();
    return recipes;
  }

  @override
  Future<Recipe?> findById(int id) {
    throw UnimplementedError();
  }
}
