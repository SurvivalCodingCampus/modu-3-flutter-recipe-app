import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/procedure_data_source_impl.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/dto/procedure_dto.dart';
import 'package:recipe_app/data/dto/recipe_dto.dart';
import 'package:recipe_app/data/repository/bookmark_repository_impl.dart';
import 'package:recipe_app/data/repository/procedure_repository_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/data_source/procedure_data_source.dart';
import 'package:recipe_app/domain/data_source/recipe_data_source.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/procedure_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/ingredient/ingredient_view_model.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
import 'package:recipe_app/presentation/splash/splash_view_model.dart';

final getIt = GetIt.instance;

void di() {
  // datasource
  getIt.registerSingleton<RecipeDataSource<RecipeDto>>(RecipeDataSourceImpl());
  getIt.registerSingleton<ProcedureDataSource<ProcedureDto>>(
    ProcedureDataSourceImpl(),
  );

  // repository - service logic
  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(getIt()));
  getIt.registerSingleton<BookmarkRepository>(BookmarkRepositoryImpl());
  getIt.registerSingleton<GetSavedRecipesUseCase>(
    GetSavedRecipesUseCase(getIt(), getIt()),
  );
  getIt.registerSingleton<ProcedureRepository>(
    ProcedureRepositoryImpl(getIt()),
  );

  // viemodel
  getIt.registerFactory(() => SearchRecipesViewModel(getIt()));
  getIt.registerFactory(() => SavedRecipesViewModel(getIt()));
  getIt.registerFactory(() => IngredientViewModel(getIt(), getIt()));
  getIt.registerFactory(() => SplashViewModel());
}
