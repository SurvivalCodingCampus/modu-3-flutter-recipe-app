import 'package:get_it/get_it.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';

import '../../data/repository/mock_recipe_repository_impl.dart';
import '../../data/repository/mock_user_repository_impl.dart';
import '../../domain/repository/recipe_repository.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../presentation/home/home_view_model.dart';
import '../../presentation/search_recipes/search_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Repository
  getIt.registerSingleton<UserRepository>(MockUserRepositoryImpl());
  getIt.registerSingleton<RecipeRepository>(MockRecipeRepositoryImpl());
  getIt.registerSingleton<GetSavedRecipesUseCase>(
    GetSavedRecipesUseCase(userRepository: getIt(), recipeRepository: getIt()),
  );

  // ViewModel
  getIt.registerFactory<HomeViewModel>(
    () =>
        HomeViewModel(getSavedRecipesUseCase: getIt(), userRepository: getIt()),
  );

  getIt.registerFactory<SearchRecipesViewModel>(() => SearchRecipesViewModel());
}
