import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/data_source.dart';
import 'package:recipe_app/data/repository/repository.dart';
import 'package:recipe_app/domain/repository/repository.dart';
import 'package:recipe_app/domain/use_case/use_case.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes.dart';
import 'package:recipe_app/presentation/search/search.dart';

final getIt = GetIt.instance;

void diSetUp() {
  // DataSource
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSourceImpl());
  getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataSourceImpl());

  // Repository
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<BookmarkRepository>(BookmarkRepositoryImpl());
  getIt.registerSingleton<ProcedureRepository>(
    ProcedureRepositoryImpl(procedureDataSource: getIt()),
  );

  // UseCase
  getIt.registerSingleton<GetSavedRecipesUseCase>(
    GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );

  getIt.registerSingleton<ToggleBookmarkRecipeUseCase>(
    ToggleBookmarkRecipeUseCase(
      bookmarkRepository: getIt(),
      recipeRepository: getIt(),
    ),
  );

  // ViewModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getSavedRecipesUseCase: getIt(),
      toggleBookmarkRecipeUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SearchViewModel>(
    () => SearchViewModel(recipeRepository: getIt()),
  );

  getIt.registerFactory<RecipeIngredientViewModel>(
    () => RecipeIngredientViewModel(
      recipeRepository: getIt(),
      procedureRepository: getIt(),
    ),
  );
}
