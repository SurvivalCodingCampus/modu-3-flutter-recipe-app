import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Recipe(name: '떡복이', imageUrl: 'imageUrl'),
      Recipe(name: '짜장면', imageUrl: 'imageUrl2'),
      Recipe(name: '라면', imageUrl: 'imageUrl3'),
    ];
  }
}
