import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/data/data_source/mock_recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock_user_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/repository/bookmark_repository_impl.dart';
import 'package:recipe_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:recipe_app/data/repository/mock_user_repository_impl.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/filter_search_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // 데이터 소스 등록
  getIt.registerSingleton(
    MockRecipeDataSource(client: http.Client(), url: 'testUrl')
        as RecipeDataSource,
  );
  getIt.registerSingleton(MockUserDataSource() as UserDataSource);

  // 레포지토리 등록
  getIt.registerSingleton(
    MockRecipeRepositoryImpl(recipeDataSource: getIt()) as RecipeRepository,
  );
  getIt.registerSingleton(
    MockUserRepositoryImpl(userDataSource: getIt()) as UserRepository,
  );
  getIt.registerSingleton(
    BookmarkRepositoryImpl(userDataSource: getIt()) as BookmarkRepository,
  );

  // 유즈케이스 등록
  getIt.registerSingleton(
    GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      userRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );

  // 뷰모델 등록
  getIt.registerFactory(
    () => SavedRecipesViewModel(getSavedRecipesUseCase: getIt()),
  );
  getIt.registerFactory(() => FilterSearchViewModel());
  getIt.registerFactory(
    () => SearchRecipesViewModel(recipeRepository: getIt()),
  );
  getIt.registerFactory(
    () => IngredientViewModel(getSavedRecipesUseCase: getIt()),
  );
}
