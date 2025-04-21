import '../model/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> fetchRecipes();

  Future<List<Recipe>> searchRecipes(String keyword);
}

//구현체 data , domain 인터페이스
//result 패턴 usecase에도 해도되고 repository에 해도됨
