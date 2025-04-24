import 'package:get_it/get_it.dart';
import 'package:recipe_app/recipe_app/data/repository/ingredients_repository.dart';
import 'package:recipe_app/recipe_app/data/repository/ingredients_repository_impl.dart';
import 'package:recipe_app/recipe_app/data/repository/procedure_repository.dart';
import 'package:recipe_app/recipe_app/data/repository/procedure_repository_impl.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/recipe_app/data_source/ingredient_data_source.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_ingredients_data_impl.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_procedure_data_impl.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/data_source/procedure_data_source.dart';
import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository_impl.dart';
import 'package:recipe_app/recipe_app/domain/repository/filter_category_repository.dart';
import 'package:recipe_app/recipe_app/domain/repository/filter_category_repository_impl.dart';
import 'package:recipe_app/recipe_app/domain/repository/select_category_repository.dart';
import 'package:recipe_app/recipe_app/domain/repository/select_category_repository_impl.dart';
import 'package:recipe_app/recipe_app/domain/use_case/add_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/filter_category_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_procedure_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_recipe_id_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/remove_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/select_category_use_case.dart';
import 'package:recipe_app/recipe_app/presentation/detail_recipe_screen/detail_recipe_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/home_screen/home_screen_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/splash_screen/splash_screen_view_model.dart';

final getIt = GetIt.instance;

void diSetUp() {
  //DataSource
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataImpl());
  getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataImpl());
  getIt.registerSingleton<IngredientDataSource>(MockIngredientsDataImpl());
  // Repository
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<ProcedureRepository>(
    ProcedureRepositoryImpl(dataSource: getIt()),
  );
  getIt.registerSingleton<BookMarkRepository>(
    BookMarkRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<FilterCategoryRepository>(
    FilterCategoryRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<SelectCategoryRepository>(
    SelectCategoryRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<IngredientsRepository>(
    IngredientsRepositoryImpl(dataSource: getIt()),
  );
  //UseCase
  getIt.registerSingleton<AddBookmarkUseCase>(AddBookmarkUseCase(getIt()));
  getIt.registerSingleton<RemoveBookmarkUseCase>(
    RemoveBookmarkUseCase(bookMarkRepository: getIt()),
  );
  getIt.registerSingleton<GetSavedRecipesUseCase>(
    GetSavedRecipesUseCase(bookMarkRepository: getIt()),
  );
  getIt.registerSingleton<FilterCategoryUseCase>(
    FilterCategoryUseCase(filterCategoryRepository: getIt()),
  );
  getIt.registerSingleton<SelectCategoryUseCase>(
    SelectCategoryUseCase(repository: getIt()),
  );
  getIt.registerSingleton<GetRecipeIdUseCase>(
    GetRecipeIdUseCase(repository: getIt()),
  );
  getIt.registerSingleton<GetProcedureUseCase>(
    GetProcedureUseCase(repository: getIt()),
  );
  //VieModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<FilterSearchViewModel>(
    () => FilterSearchViewModel(useCase: getIt(), recipeRepository: getIt()),
  );
  getIt.registerFactory<SearchRecipesViewModel>(
    () => SearchRecipesViewModel(getIt()),
  );
  getIt.registerFactory<HomeScreenViewModel>(
    () => HomeScreenViewModel(
      useCase: getIt(),
      addBookmarkUseCase: getIt(),
      removeBookmarkUseCase: getIt(),
    ),
  );
  getIt.registerFactory<SplashScreenViewModel>(() => SplashScreenViewModel());
  getIt.registerFactory<DetailRecipeViewModel>(
    () => DetailRecipeViewModel(
      useCase: getIt(),
      getProcedureUseCase: getIt(),
      ingredientsRepository: getIt(),
    ),
  );
}
