import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/core/di/di_setup.dart';
import 'package:recipe_app/recipe_app/core/routing/router.dart';

import 'recipe_app/data/repository/recipe_repository.dart';
import 'recipe_app/presentation/filter_search/filter_search_view_model.dart';

void main() {
  diSetUp();
  runApp(MyApp(repository: getIt(), filterSearchViewModel: getIt()));
}

class MyApp extends StatelessWidget {
  final RecipeRepository repository;
  final FilterSearchViewModel filterSearchViewModel;

  const MyApp({
    super.key,
    required this.repository,
    required this.filterSearchViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
