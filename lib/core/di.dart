import 'package:recipe_app/data/data_source/interface/recipe_data_source.dart';
import 'package:recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:recipe_app/data/repository/bookmark_repository_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/repository/bookmark_repository.dart';
import 'package:recipe_app/domain/repository/recipe_repository.dart';
import 'package:recipe_app/domain/use_case/get_saved_recipes_use_case.dart';
import 'package:recipe_app/domain/use_case/remove_saved_recipes_use_case.dart';
import 'package:recipe_app/presentation/saved_recipes/saved_recipes_view_model.dart';

final RecipeDataSource recipeDataSource = MockRecipeDataSource();
final RecipeRepository recipeRepository = RecipeRepositoryImpl(
  recipeDataSource,
);

final BookmarkRepository bookmarkRepository = BookmarkRepositoryImpl(
  recipeDataSource,
);

final GetSavedRecipesUseCase getSavedRecipesUseCase = GetSavedRecipesUseCase(
  bookmarkRepository,
);
final RemoveSavedRecipesUseCase removeSavedRecipesUseCase =
    RemoveSavedRecipesUseCase(bookmarkRepository);

final savedRecipesViewModel = SavedRecipesViewModel(
  getSavedRecipesUseCase,
  removeSavedRecipesUseCase,
);
