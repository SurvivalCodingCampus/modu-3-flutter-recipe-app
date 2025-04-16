import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/user_data_source.dart';
import 'package:recipe_app/data/mocks/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/mocks/mock_user_data_source.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/data/repository/user_repository_impl.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/usecase/get_bookmarked_recipes_usecase.dart';
import 'package:recipe_app/domain/usecase/get_recipe_by_id_usecase.dart';
import 'package:recipe_app/domain/usecase/toggle_bookmark_usecase.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';

class AppDependencies {
  late final UserRepository userRepository;
  late final RecipeRepository recipeRepository;

  late final UserDataSource userDataSource;
  late final RecipeDataSource recipeDataSource;

  late final GetRecipeByIdUseCase getRecipeByIdUseCase;
  late final GetBookmarkedRecipesUseCase getBookmarkedRecipesUseCase;
  late final ToggleBookmarkUseCase toggleBookmarkUseCase;

  late final SavedRecipesViewModel savedRecipesViewModel;
  late final SearchRecipesViewModel searchRecipesViewModel;
  late final IngredientViewModel ingredientViewModel;

  AppDependencies() {
    userDataSource = MockUserDataSource();
    recipeDataSource = MockRecipeDataSourceImpl();

    userRepository = UserRepositoryImpl(dataSource: userDataSource);
    recipeRepository = RecipeRepositoryImpl(
      remoteDataSource: null,
      localDataSource: recipeDataSource,
    );

    getRecipeByIdUseCase = GetRecipeByIdUseCase(recipeRepository);
    getBookmarkedRecipesUseCase = GetBookmarkedRecipesUseCase(
      userRepository: userRepository,
      recipeRepository: recipeRepository,
    );
    toggleBookmarkUseCase = ToggleBookmarkUseCase(
      userRepository: userRepository,
    );

    savedRecipesViewModel = SavedRecipesViewModel(
      getBookmarkedRecipes: getBookmarkedRecipesUseCase,
      toggleBookmark: toggleBookmarkUseCase,
    );

    searchRecipesViewModel = SearchRecipesViewModel(recipeRepository);

    ingredientViewModel = IngredientViewModel(
      getRecipeById: getRecipeByIdUseCase,
    );
  }
}
