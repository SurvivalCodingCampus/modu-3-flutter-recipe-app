import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/pages/recipe/home/home_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/search/screen/search_screen.dart';
import 'package:recipe_app/presentation/pages/recipe/search/screen/search_screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SearchScreen(),
    );
  }
}
