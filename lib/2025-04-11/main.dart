import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'data/recipe_data_source.dart';
import 'repository/recipe_repository.dart';
import 'viewmodel/saved_recipes_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SavedRecipesViewModel(RecipeRepository(RecipeDataSource())),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: SplashScreen(),
    );
  }
}