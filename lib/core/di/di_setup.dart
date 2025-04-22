import 'package:get_it/get_it.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

import '../../data/repositoryImpl/mock_recipe_repository_impl.dart';
import '../../domain/repository/recipe_ropository.dart';
import '../../presentation/search_recipes/search_recipes_view_model.dart';
import '../../presentation/splash/splash_view_model.dart';
import '../network/network_status_checker.dart';
import '../network/network_status_checker_impl.dart';

final getIt = GetIt.instance;

void diSetup() {

  //DataSource

  //Repository
  getIt.registerSingleton<RecipeRepository>(MockRecipeRepositoryImpl());
  getIt.registerSingleton<NetworkStatusChecker>(MockNetwrokStatusCheckerImpl());

  //UseCase


  //ViewModel (안에 함수를 써야)
  getIt.registerFactory<SearchRecipesViewModel>(() => SearchRecipesViewModel(recipeRepository: getIt()));
  getIt.registerFactory<SavedRecipesViewModel>(() => SavedRecipesViewModel(recipeRepository: getIt()));
  getIt.registerFactory<SplashViewModel>(() => SplashViewModel(networkStatusChecker: getIt()));

}