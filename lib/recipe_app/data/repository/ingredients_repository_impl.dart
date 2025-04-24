import 'package:recipe_app/recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/recipe_app/data/repository/ingredients_repository.dart';
import 'package:recipe_app/recipe_app/data_source/ingredient_data_source.dart';

class IngredientsRepositoryImpl implements IngredientsRepository {
  IngredientDataSource dataSource;

  IngredientsRepositoryImpl({required this.dataSource});

  @override
  Future<List<Ingredient>> getIngredients() async {
    final ingredientList = await dataSource.getIngredientData();
    return ingredientList;
  }
}
