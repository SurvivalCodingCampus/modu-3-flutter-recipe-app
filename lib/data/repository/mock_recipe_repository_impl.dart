import 'package:recipe_app/domain/model/recipe.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';

class MockRecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Recipe(name: '떡복이', imageUrl: 'imageUrl', userId: '1'),
      Recipe(name: '짜장면', imageUrl: 'imageUrl2', userId: '1'),
      Recipe(name: '라면', imageUrl: 'imageUrl3', userId: '2'),
    ];
  }

  @override
  Future<List<Recipe>> getRecipesByUser(String userId) async {
    final recipes = await getRecipes();
    return recipes.where((e) => e.userId == userId).toList();
  }
}
