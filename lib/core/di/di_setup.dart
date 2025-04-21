import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/bookmark/bookmark_data_source.dart';
import 'package:recipe_app/data/data_source/bookmark/bookmark_data_source_impl.dart';
import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:recipe_app/data/data_source/steps/steps_data_source.dart';
import 'package:recipe_app/data/data_source/steps/steps_data_source_impl.dart';
import 'package:recipe_app/data/data_source/user/user_data_source.dart';
import 'package:recipe_app/data/data_source/user/user_data_source_impl.dart';
import 'package:recipe_app/data/repository/bookmark/bookmark_repository_impl.dart';
import 'package:recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:recipe_app/data/repository/step/step_repository_impl.dart';
import 'package:recipe_app/domain/repository/bookmark/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/domain/repository/step/step_repository.dart';
import 'package:recipe_app/domain/use_case/saved_recipe/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // Data Source
  getIt.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());
  getIt.registerSingleton<StepsDataSource>(StepsDataSourceImpl());
  getIt.registerSingleton<BookmarkDataSource>(BookmarkDataSourceImpl());
  getIt.registerSingleton<UserDataSource>(UserDataSourceImpl());

  // Repository
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(getIt(), getIt()),
  );
  getIt.registerSingleton<BookmarkRepository>(BookmarkRepositoryImpl(getIt()));
  getIt.registerSingleton<StepRepository>(StepRepositoryImpl(getIt()));

  // ViewModel
  getIt.registerFactory(() => SavedRecipesViewModel(getIt(), getIt()));
  getIt.registerFactory(() => SearchRecipesViewModel(getIt()));

  // UseCase
  getIt.registerSingleton(
    GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );
}
