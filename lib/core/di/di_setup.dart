import 'package:get_it/get_it.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../data/repository/recipe_ropository.dart';
import '../../presentation/search_recipes/search_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {

  //DataSource

  //Repository
  getIt.registerSingleton<RecipeRepository>(MockRecipeRepositoryImpl());

  //UseCase


  //ViewModel (안에 함수를 써야)
  getIt.registerFactory<SearchRecipesViewModel>(() => SearchRecipesViewModel(recipeRepository: getIt()));
  getIt.registerFactory<SavedRecipesViewModel>(() => SavedRecipesViewModel(getIt()));
}