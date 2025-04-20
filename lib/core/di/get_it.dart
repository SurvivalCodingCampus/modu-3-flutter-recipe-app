import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/recipe/recipe_data_source.dart';

import '../../data/data_source/recipe/recipe_data_source_impl.dart';
import '../../data/repository/recipe_repository/recipe_repository.dart';
import '../../data/repository/recipe_repository/recipe_repository_impl.dart';
import '../../domain/use_case/get_ingredient_by_use_case.dart';
import '../../domain/use_case/get_procedure_by_use_case.dart';
import '../../domain/use_case/get_recipe_by_use_case.dart';
import '../../domain/use_case/get_recipe_use_case.dart';
import '../../domain/use_case/get_saved_recipes_use_case.dart';
import '../../domain/use_case/toggle_book_mark_use_case.dart';
import '../../presentation/main/home/home_view_model.dart';
import '../../presentation/recipe_screen/recipe_screen_view_model.dart';
import '../../presentation/saved_recipe/saved_recipe_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // data source
  getIt.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());

  // repository
  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(getIt()));

  // useCase
  getIt.registerSingleton<GetRecipeByUseCase>(GetRecipeByUseCase(getIt()));
  getIt.registerSingleton<GetRecipeUseCase>(GetRecipeUseCase(getIt()));
  getIt.registerSingleton<GetIngredientByUseCase>(
    GetIngredientByUseCase(getIt()),
  );
  getIt.registerSingleton<GetProceduresByRecipeUseCase>(
    GetProceduresByRecipeUseCase(getIt()),
  );
  getIt.registerSingleton<ToggleBookMarkUseCase>(
    ToggleBookMarkUseCase(getIt()),
  );
  getIt.registerSingleton<GetSavedRecipesUseCase>(
    GetSavedRecipesUseCase(getIt()),
  );

  // viewModel
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel(getIt()));
  getIt.registerFactory<RecipeScreenViewModel>(
    () => RecipeScreenViewModel(getIt(), getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<SavedRecipeViewModel>(
    () => SavedRecipeViewModel(getIt(), getIt()),
  );
}
