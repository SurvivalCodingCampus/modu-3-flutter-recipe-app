import 'package:recipe_app/data/repository/recipe_repository/recipe_repository.dart';

import '../../data_source/recipe/recipe_data_source.dart';
import '../../model/recipe_model.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource dataSource;

  RecipeRepositoryImpl(this.dataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    try {
      return await dataSource.getRecipes();
    } catch (e, stackTrace) {
      print('기능 오류: $e');
      print(stackTrace);
      rethrow;
    }
  }
}
