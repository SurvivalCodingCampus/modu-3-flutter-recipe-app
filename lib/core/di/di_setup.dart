import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/file_data_source.dart';
import 'package:recipe_app/data/data_source/file_data_source_impl.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/data_source/settings_data_source.dart';
import 'package:recipe_app/data/data_source/settings_data_source_impl.dart';
import 'package:recipe_app/data/repository/book_mark_repository_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/data/repository/settings_repository_impl.dart';
import 'package:recipe_app/domain/repository/book_mark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/settings_repository.dart';
import 'package:recipe_app/domain/use_case/get_recent_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/get_recipe_info_use_case.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/save_recent_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/throw_when_settings_info_use_case.dart';
import 'package:recipe_app/domain/use_case/toggle_favorite_use_case.dart';
import 'package:recipe_app/presentation/home/home_view_model.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_state.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/saved_recipe/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/splash_screen/splash_view_model.dart';
import 'package:recipe_app/presentation/utils/debouncer.dart';

final GetIt getIt = GetIt.instance;

void diSetup() {
  // DataSource
  getIt.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());
  getIt.registerSingleton<SettingsDataSource>(SettingsDataSourceImpl());
  getIt.registerSingleton<FileDataSource>(FileDataSourceImpl());

  // Repository
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(
      recipeDataSource: getIt(),
      fileDataSource: getIt<FileDataSource>(),
    ),
  );
  getIt.registerSingleton<BookmarkRepository>(
    BookmarkRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(settingsDataSource: getIt<SettingsDataSource>()),
  );

  // UseCase
  getIt.registerSingleton<GetSavedRecipesUseCase>(
    GetSavedRecipesUseCase(recipeRepository: getIt()),
  );
  getIt.registerSingleton<ToggleFavoriteUseCase>(
    ToggleFavoriteUseCase(bookmarkRepository: getIt()),
  );
  getIt.registerSingleton<GetRecipeInfoUseCase>(
    GetRecipeInfoUseCase(recipeRepository: getIt()),
  );
  getIt.registerSingleton<ThrowWhenSettingsInfoUseCase>(
    ThrowWhenSettingsInfoUseCase(
      settingsRepository: getIt<SettingsRepository>(),
    ),
  );

  getIt.registerSingleton<GetRecentRecipesUseCase>(
    GetRecentRecipesUseCase(recipeRepository: getIt()),
  );

  getIt.registerSingleton<SaveRecentRecipesUseCase>(
    SaveRecentRecipesUseCase(recipeRepository: getIt()),
  );

  // Util
  getIt.registerFactory<Debouncer>(
    () => Debouncer(delay: const Duration(milliseconds: 500)),
  );

  // ViewModel
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      getSavedRecipesUseCase: getIt<GetSavedRecipesUseCase>(),
      toggleFavoriteUseCase: getIt<ToggleFavoriteUseCase>(),
    ),
  );

  getIt.registerFactory<SplashViewModel>(
    () => SplashViewModel(
      throwWhenSettingsInfoUseCase: getIt<ThrowWhenSettingsInfoUseCase>(),
    ),
  );

  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getSavedRecipesUseCase: getIt(),
      toggleFavoriteUseCase: getIt(),
    ),
  );

  getIt.registerFactory<SearchRecipesViewModel>(
    () => SearchRecipesViewModel(
      getSavedRecipesUseCase: getIt(),
      getRecentRecipesUseCase: getIt<GetRecentRecipesUseCase>(),
      saveRecentRecipesUseCase: getIt<SaveRecentRecipesUseCase>(),
      debouncer: getIt(),
    ),
  );

  getIt.registerFactoryParam<IngredientViewModel, String, void>(
    (id, _) => IngredientViewModel(
      state: IngredientState(id: id),
      getRecipeInfoUseCase: getIt(),
    ),
  );
}
