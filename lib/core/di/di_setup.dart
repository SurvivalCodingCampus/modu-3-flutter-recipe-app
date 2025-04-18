import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/mocks/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/mocks/mock_user_data_source.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/data/repository/user_repository_impl.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/usecase/get_bookmarked_recipes_usecase.dart';
import 'package:recipe_app/domain/usecase/get_recipe_by_id_usecase.dart';
import 'package:recipe_app/domain/usecase/set_recipe_rating_usecase.dart';
import 'package:recipe_app/domain/usecase/toggle_bookmark_usecase.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

import '../../domain/repository/recipe_repository.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSourceImpl());
  getIt.registerSingleton<UserDataSource>(MockUserDataSource());

  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(remoteDataSource: null, localDataSource: getIt()),
  );
  getIt.registerSingleton<GetRecipeByIdUseCase>(GetRecipeByIdUseCase(getIt()));
  getIt.registerSingleton<GetBookmarkedRecipesUseCase>(
    GetBookmarkedRecipesUseCase(
      userRepository: getIt(),
      recipeRepository: getIt(),
    ),
  );
  getIt.registerSingleton<ToggleBookmarkUseCase>(
    ToggleBookmarkUseCase(getIt()),
  );
  getIt.registerSingleton<SetRecipeRatingUseCase>(
    SetRecipeRatingUseCase(getIt()),
  );

  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getBookmarkedRecipes: getIt(),
      toggleBookmark: getIt(),
    ),
  );
  getIt.registerFactory<SearchRecipesViewModel>(
    () => SearchRecipesViewModel(getIt()),
  );
  getIt.registerFactory<IngredientViewModel>(
    () => IngredientViewModel(getRecipeById: getIt(), setRecipeRating: getIt()),
  );
}
