import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:recipe_app/data/repository/bookmark_repository_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/get_recipe_use_case.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/remove_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_screen_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetUp() {
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSource());

  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(getIt()));
  getIt.registerSingleton<BookmarkRepository>(BookmarkRepositoryImpl(getIt()));

  getIt.registerFactory<IngredientScreenViewModel>(
    () => IngredientScreenViewModel(getIt()),
  );

  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(getIt(), getIt()),
  );
  getIt.registerFactory<SearchRecipesViewModel>(
    () => SearchRecipesViewModel(getIt(), getIt()),
  );

  getIt.registerSingleton<SearchRecipesUseCase>(SearchRecipesUseCase(getIt()));
  getIt.registerSingleton(GetRecipeUseCase(getIt()));
  getIt.registerSingleton(RemoveSavedRecipesUseCase(getIt()));
  getIt.registerSingleton(GetSavedRecipesUseCase(getIt()));
}
