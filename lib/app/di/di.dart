import 'package:get_it/get_it.dart';

import 'package:recipe_app/data/repository_impl/bookmark_repository_impl.dart';
import 'package:recipe_app/data/repository_impl/recipe_repository_impl.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/usecase/get_saved_recipes_usecase.dart';
import 'package:recipe_app/domain/usecase/get_saved_recipes_usecase_impl.dart';
import 'package:recipe_app/domain/usecase/unbookmark_recipe_usecase.dart';
import 'package:recipe_app/domain/usecase/unbookmark_recipe_usecase_impl.dart';

import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart'; // ✅ 구현체 import

import 'package:recipe_app/presentation/screen/recipe/saved_recipes_view_model.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // ✅ DataSource
  getIt.registerLazySingleton<RecipeDataSource>(() => RecipeDataSourceImpl()); // 🔥 수정 포인트

  // ✅ Repository
  getIt.registerLazySingleton<RecipeRepository>(
      () => RecipeRepositoryImpl(getIt()));
  getIt.registerLazySingleton<BookmarkRepository>(
      () => BookmarkRepositoryImpl());

  // ✅ UseCase
  getIt.registerLazySingleton<GetSavedRecipesUseCase>(
      () => GetSavedRecipesUseCaseImpl(getIt()));
  getIt.registerLazySingleton<UnbookmarkRecipeUseCase>(
      () => UnbookmarkRecipeUseCaseImpl(getIt()));

  // ✅ ViewModel
  getIt.registerFactory(() => SavedRecipesViewModel(
        getIt<GetSavedRecipesUseCase>(),
        getIt<UnbookmarkRecipeUseCase>(),
        getIt<BookmarkRepository>(),
      ));
}
