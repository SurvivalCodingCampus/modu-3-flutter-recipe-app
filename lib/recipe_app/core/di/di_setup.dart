import 'package:get_it/get_it.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository.dart';
import 'package:recipe_app/recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/recipe_app/data_source/mock/mock_recipe_data_impl.dart';
import 'package:recipe_app/recipe_app/data_source/recipe_data_source.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository.dart';
import 'package:recipe_app/recipe_app/domain/repository/book_mark_repository_impl.dart';
import 'package:recipe_app/recipe_app/domain/use_case/add_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/recipe_app/domain/use_case/remove_bookmark_use_case.dart';
import 'package:recipe_app/recipe_app/presentation/filter_search/filter_search_view_model.dart';
import 'package:recipe_app/recipe_app/presentation/saved_recipes_screen/saved_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetUp() {
  //DataSource
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataImpl());
  // Repository
  getIt.registerSingleton<RecipeRepository>(
    RecipeRepositoryImpl(recipeDataSource: getIt()),
  );
  getIt.registerSingleton<BookMarkRepository>(
    BookMarkRepositoryImpl(recipeDataSource: getIt()),
  );
  //UseCase
  getIt.registerSingleton<AddBookmarkUseCase>(AddBookmarkUseCase(getIt()));
  getIt.registerSingleton<RemoveBookmarkUseCase>(
    RemoveBookmarkUseCase(bookMarkRepository: getIt()),
  );
  getIt.registerSingleton<GetSavedRecipesUseCase>(
    GetSavedRecipesUseCase(bookMarkRepository: getIt()),
  );
  //VieModel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(getIt(), getIt(), getIt()),
  );
  getIt.registerFactory<FilterSearchViewModel>(
    () => FilterSearchViewModel(getIt()),
  );
}
