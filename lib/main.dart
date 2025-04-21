import 'package:flutter/material.dart';
import 'package:recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/recipe_app.dart';

void main() {
  diSetup();
  runApp(const RecipeApp());
}
