import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/recipe_data_source_impl.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/presentation/components/f_big_button.dart';
import 'package:recipe_app/presentation/components/f_filter_button.dart';
import 'package:recipe_app/presentation/components/f_ingredient_item.dart';
import 'package:recipe_app/presentation/components/f_medium_button.dart';
import 'package:recipe_app/presentation/components/f_rating_button.dart';
import 'package:recipe_app/presentation/components/f_rating_dialog.dart';
import 'package:recipe_app/presentation/components/f_recipe_card.dart';
import 'package:recipe_app/presentation/components/f_small_button.dart';
import 'package:recipe_app/presentation/saved_recipe/view/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/saved_recipe/view_model/saved_recipes_view_model.dart';
import 'package:recipe_app/presentation/splash_screen/view/splash_screen.dart';
import 'package:recipe_app/ui/color_styles.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.white,
        body: SplashScreen()
      ),
    ),
  );
}
