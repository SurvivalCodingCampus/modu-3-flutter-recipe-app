import 'package:recipe_app/data/data_source/interface/data_source.dart';
import 'package:recipe_app/domain/model/recipe.dart';

abstract interface class RecipeDataSource implements DataSource<List<Recipe>> {}
