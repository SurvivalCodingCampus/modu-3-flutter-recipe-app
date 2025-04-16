import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _dataSource;

  const RecipeRepositoryImpl(this._dataSource);

  @override
  Future<List<Recipe>> findAll() async {
    return await _dataSource.fetch();
  }

  @override
  Future<Recipe?> findById(int id) {
    throw UnimplementedError();
  }
}
