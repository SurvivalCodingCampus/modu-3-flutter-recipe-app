import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/search_data_source.dart';
import 'package:recipe_app/data/data_source/search_data_source_impl.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/mocks/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/mocks/mock_user_data_source.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/data/repository/search_data_repository_impl.dart';
import 'package:recipe_app/data/repository/user_repository_impl.dart';
import 'package:recipe_app/domain/repository/search_data_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/usecase/check_network_error_use_case.dart';
import 'package:recipe_app/domain/usecase/get_bookmarked_recipeIds_use_case.dart';
import 'package:recipe_app/domain/usecase/get_bookmarked_recipes_use_case.dart';
import 'package:recipe_app/domain/usecase/get_recipe_by_id_use_case.dart';
import 'package:recipe_app/domain/usecase/get_recipe_categories_use_case.dart';
import 'package:recipe_app/domain/usecase/get_recipes_by_category_use_case.dart';
import 'package:recipe_app/domain/usecase/get_recipes_use_case.dart';
import 'package:recipe_app/domain/usecase/get_search_data_use_case.dart';
import 'package:recipe_app/domain/usecase/set_recipe_rating_use_case.dart';
import 'package:recipe_app/domain/usecase/toggle_bookmark_use_case.dart';
import 'package:recipe_app/domain/usecase/update_search_data_use_case.dart';
import 'package:recipe_app/presentation/main_tab/home/home_view_model.dart';
import 'package:recipe_app/presentation/main_tab/tab_screen/main_tab_view_model.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';

import '../../domain/repository/recipe_repository.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSourceImpl());
  getIt.registerSingleton<UserDataSource>(MockUserDataSource());

  getIt.registerSingleton<SearchDataSource>(SearchDataSourceImpl());

  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(remoteDataSource: null, localDataSource: getIt()),
  );
  getIt.registerSingleton<SearchDataRepository>(
    SearchDataRepositoryImpl(dataSource: getIt()),
  );

  getIt.registerSingleton<GetRecipeByIdUseCase>(GetRecipeByIdUseCase(getIt()));
  getIt.registerSingleton<GetBookmarkedRecipesUseCase>(
    GetBookmarkedRecipesUseCase(
      userRepository: getIt(),
      recipeRepository: getIt(),
    ),
  );
  getIt.registerSingleton<CheckNetworkErrorUseCase>(CheckNetworkErrorUseCase());
  getIt.registerSingleton<GetRecipesUseCase>(GetRecipesUseCase(getIt()));
  getIt.registerSingleton<ToggleBookmarkUseCase>(
    ToggleBookmarkUseCase(getIt()),
  );
  getIt.registerSingleton<SetRecipeRatingUseCase>(
    SetRecipeRatingUseCase(getIt()),
  );
  getIt.registerSingleton<GetSearchDataUseCase>(GetSearchDataUseCase(getIt()));
  getIt.registerSingleton<UpdateSearchDataUseCase>(
    UpdateSearchDataUseCase(getIt()),
  );

  getIt.registerSingleton<GetRecipeCategoriesUseCase>(
    GetRecipeCategoriesUseCase(getIt()),
  );
  getIt.registerSingleton<GetRecipesByCategoryUseCase>(
    GetRecipesByCategoryUseCase(getIt()),
  );
  getIt.registerSingleton<GetBookmarkedRecipeIdsUseCase>(
    GetBookmarkedRecipeIdsUseCase(getIt()),
  );

  getIt.registerFactory<MainTabViewModel>(() => MainTabViewModel());
  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(
      getCategories: getIt(),
      getRecipesByCategory: getIt(),
      toggleBookmark: getIt(),
      getBookmarkedRecipeIds: getIt(),
    ),
  );

  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(
      getBookmarkedRecipes: getIt(),
      toggleBookmark: getIt(),
    ),
  );
  getIt.registerFactory<SearchRecipesViewModel>(
    () => SearchRecipesViewModel(
      getRecipesUseCase: getIt(),
      updateSearchDataUseCase: getIt(),
      getSearchDataUseCase: getIt(),
    ),
  );
  getIt.registerFactory<RecipeDetailViewModel>(
    () =>
        RecipeDetailViewModel(getRecipeById: getIt(), setRecipeRating: getIt()),
  );

  getIt.registerFactory<SplashViewModel>(() => SplashViewModel(getIt()));
}
