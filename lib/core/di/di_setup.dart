import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/chef_data_source.dart';
import 'package:recipe_app/data/data_source/mock_chef_data_source_impl.dart';
import 'package:recipe_app/data/data_source/mock_procedure_data_source_impl.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/data_source/procedure_data_source.dart';
import 'package:recipe_app/data/data_source/recipe_data_source.dart';
import 'package:recipe_app/data/repository/chef_repository_impl.dart';
import 'package:recipe_app/data/repository/mock_user_repository_impl.dart';
import 'package:recipe_app/data/repository/procedure_repository_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/repository/chef_repository.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/repository/user_repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/search_chef_by_recipe_chef_use_case.dart';
import 'package:recipe_app/domain/use_case/toggle_bookmark_use_case.dart';
import 'package:recipe_app/presentation/ingredient/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/main/saved_recipes/saved_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // DataSource
  getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataSourceImpl());
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSourceImpl());
  getIt.registerSingleton<ChefDataSource>(MockChefDataSourceImpl());

  // Repository
  getIt.registerSingleton<UserRepository>(MockUserRepositoryImpl());
  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(recipeDataSource: getIt()));
  getIt.registerSingleton<ProcedureRepository>(ProcedureRepositoryImpl(procedureDataSource: getIt()));
  getIt.registerSingleton<ChefRepository>(ChefRepositoryImpl(chefDataSource: getIt()));

  // UseCase
  getIt.registerSingleton(GetSavedRecipesUseCase(userRepository: getIt(), recipeRepository: getIt()));
  getIt.registerSingleton(SearchChefByRecipeChef(chefRepository: getIt(), recipeRepository: getIt()));
  getIt.registerSingleton(ToggleBookmarkUseCase(userRepository: getIt()));

  // ViewModel
  getIt.registerFactory(() => SavedRecipesViewModel(getSavedRecipesUseCase: getIt(), toggleBookmarkUseCase: getIt()));
  getIt.registerFactory(() => SearchRecipesViewModel(recipeRepository: getIt()));
}