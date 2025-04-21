import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/procedure/procedure_data_source.dart';
import 'package:recipe_app/data/repository/chef/chef_repository.dart';
import 'package:recipe_app/data/repository/chef/chef_repository_impl.dart';
import 'package:recipe_app/data/repository/procedure/procedure_repository.dart';
import 'package:recipe_app/data/repository/procedure/procedure_repository_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_state.dart';
import 'package:recipe_app/presentation/recipe_detail/recipe_detail_view_model.dart';
import 'package:recipe_app/presentation/saved_recipe/get_saved_recipe_use_case.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';

import '../../data/data_source/chef/chef_data_source.dart';
import '../../data/data_source/chef/chef_data_source_impl.dart';
import '../../data/data_source/procedure/procedure_data_source_impl.dart';
import '../../data/data_source/recipe/recipe_data_source.dart';
import '../../data/data_source/recipe/recipe_data_source_impl.dart';
import '../../presentation/bookmark_recipe/bookmark_repository.dart';
import '../../presentation/bookmark_recipe/bookmark_repository_impl.dart';
import '../../presentation/saved_recipe/saved_recipe_view_model.dart';


final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());
  getIt.registerSingleton<ChefDataSource>(ChefDataSourceImpl());
  getIt.registerSingleton<ProcedureDataSource>(ProcedureDataSourceImpl());


  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(getIt<RecipeDataSource>()));
  getIt.registerSingleton<BookmarkRepository>(
    BookmarkRepositoryImpl(getIt<RecipeDataSource>()),
  );
  getIt.registerSingleton<ChefRepository>(
    ChefRepositoryImpl(getIt<ChefDataSource>()));
  getIt.registerSingleton<ProcedureRepository>(
    ProcedureRepositoryImpl(getIt<ProcedureDataSource>()));


  getIt.registerSingleton(GetSavedRecipeUseCase(getIt()));


  getIt.registerFactory(() => SavedRecipeViewModel(getIt()));
  getIt.registerFactory(() => SplashViewModel());

  getIt.registerFactoryParam<RecipeDetailViewModel, RecipeDetailState, void>((state, _) =>
      RecipeDetailViewModel(
          chefRepository: getIt(),
          procedureRepository: getIt(),
          state: state));

}