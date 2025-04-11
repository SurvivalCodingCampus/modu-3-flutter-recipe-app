import 'dart:convert';
import 'dart:io';

import 'package:recipe_app/data/data_source/recipe_data_source.dart';

import '../dto/recipe_dto.dart';

class RecipeDataSourceImpl implements RecipeDataSource{
  @override
  Future<List<RecipeDto>> getRecipeDtos() async {
    return [];
  }
}