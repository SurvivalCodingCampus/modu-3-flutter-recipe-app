import 'package:flutter/services.dart';
import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';
import 'package:recipe_app/recipe_app/domain/repository/copy_link_repository.dart';

class CopyLinkRepositoryImpl implements CopyLinkRepository {
  final RecipeDataSource _recipeDataSource;

  CopyLinkRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  //링크 텍스트로 반환
  @override
  Future<String> getLink(int id) async {
    final recipes = await _recipeDataSource.getRecipeData();
    final recipe = recipes.firstWhere((e) => e.id == id);
    return 'app.Recipe.co/${recipe.id}';
  }

  //링크 공유하기위해 복사
  @override
  Future<void> copyLink(int id) async {
    final recipes = await _recipeDataSource.getRecipeData();
    final recipe = recipes.where((e) => e.id == id).toList().first;
    Clipboard.setData(ClipboardData(text: 'app.Recipe.co/${recipe.id}'));
  }
}
