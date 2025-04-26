import 'package:flutter/services.dart';
import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';
import 'package:recipe_app/recipe_app/domain/repository/copy_link_repository.dart';

class CopyLinkRepositoryImpl implements CopyLinkRepository{
  final RecipeDataSource _recipeDataSource;

  CopyLinkRepositoryImpl({required RecipeDataSource recipeDataSource}) : _recipeDataSource = recipeDataSource;

  @override
  Future<void> copyLink(int id)async{
    final recipes =await _recipeDataSource.getRecipeData();
    final recipe = recipes.where((e) => e.id == id).toList().first;
            Clipboard.setData(ClipboardData(text: 'app.Recipe.co/${recipe.id}'));
            ClipboardData? data= await Clipboard.getData(Clipboard.kTextPlain);
     print(data?.text??"");

  }

}