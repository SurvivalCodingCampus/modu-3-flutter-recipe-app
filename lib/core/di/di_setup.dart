import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/data_source/recipes/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/recipes/recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipes/recipe_repository_impl.dart';
import 'package:recipe_app/domain/repository/recipe/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/page/search_recipes/search_recipes_view_model.dart';

class DiSetup {
  final getIt = GetIt.instance;

  void diSetUp() {
    getIt.registerSingleton<RecipeDataSource>(RecipeDataSourceImpl());

    getIt.registerSingleton<RecipeRepository>(
      RecipeRepositoryImpl(dataSource: getIt()),
    );

    getIt.registerSingleton(GetSavedRecipesUseCase(recipeRepository: getIt()));

    getIt.registerFactory<SavedRecipesViewModel>(
      () => SavedRecipesViewModel(getSavedRecipesUseCase: getIt()),
    );

    getIt.registerFactory<SearchRecipesViewModel>(
      () => SearchRecipesViewModel(recipeRepository: getIt()),
    );
  }
}
