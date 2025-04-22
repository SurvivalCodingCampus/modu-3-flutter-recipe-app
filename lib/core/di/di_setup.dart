import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/local_data_source.dart/local_data_source.dart';
import 'package:recipe_app/data/remote_data_source/remote_data_source.dart';
import 'package:recipe_app/data/repository/repository.dart';
import 'package:recipe_app/data/repository/search_recipe_repository_impl.dart';
import 'package:recipe_app/domain/repository/repository.dart';
import 'package:recipe_app/domain/use_case/search_recipe_use_case.dart';
import 'package:recipe_app/domain/use_case/use_case.dart';
import 'package:recipe_app/presentation/recipe_ingredient/recipe_ingredient_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes.dart';
import 'package:recipe_app/presentation/search/search.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';

final getIt = GetIt.instance;

void diSetUp() {
  // DataSource
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSourceImpl());
  getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataSourceImpl());
  getIt.registerSingleton<LocalSearchRecipeDataSource>(
    LocalSearchRecipeDataSourceImpl(),
  );

  // Repository
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<BookmarkRepository>(BookmarkRepositoryImpl());
  getIt.registerSingleton<ProcedureRepository>(
    ProcedureRepositoryImpl(procedureDataSource: getIt()),
  );
  getIt.registerSingleton<NetworkRepository>(SuccessNetworkRepositoryImpl());
  getIt.registerSingleton<SearchRecipeRepository>(
    SearchRecipeRepositoryImpl(localSearchResultDataSource: getIt()),
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

  getIt.registerSingleton<SearchRecipeUseCase>(
    SearchRecipeUseCase(
      recipeRepository: getIt(),
      searchRecipeRepository: getIt(),
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
    () => SearchViewModel(
      searchRecipeRepository: getIt(),
      searchRecipeUseCase: getIt(),
    ),
  );

  getIt.registerFactory<RecipeIngredientViewModel>(
    () => RecipeIngredientViewModel(
      recipeRepository: getIt(),
      procedureRepository: getIt(),
    ),
  );

  getIt.registerFactory<SplashViewModel>(
    () => SplashViewModel(networkRepository: getIt()),
  );
}

void networkErrorDiSetup() {
  // DataSource
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSourceImpl());
  getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataSourceImpl());
  getIt.registerSingleton<LocalSearchRecipeDataSource>(
    LocalSearchRecipeDataSourceImpl(),
  );

  // Repository
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<BookmarkRepository>(BookmarkRepositoryImpl());
  getIt.registerSingleton<ProcedureRepository>(
    ProcedureRepositoryImpl(procedureDataSource: getIt()),
  );
  getIt.registerSingleton<NetworkRepository>(FailNetworkRepositoryImpl());

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

  getIt.registerSingleton<SearchRecipeUseCase>(
    SearchRecipeUseCase(
      recipeRepository: getIt(),
      searchRecipeRepository: getIt(),
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
    () => SearchViewModel(
      searchRecipeRepository: getIt(),
      searchRecipeUseCase: getIt(),
    ),
  );

  getIt.registerFactory<RecipeIngredientViewModel>(
    () => RecipeIngredientViewModel(
      recipeRepository: getIt(),
      procedureRepository: getIt(),
    ),
  );

  getIt.registerFactory<SplashViewModel>(
    () => SplashViewModel(networkRepository: getIt()),
  );
}
