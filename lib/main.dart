import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/search/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: SearchScreen(
        recipes: List.generate(
          10,
          (index) => Recipe(
            id: '$index',
            name: 'Traditional spare ribs baked',
            imageUrl:
                'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
            chef: 'Chef John',
            totalTimeMinutes: '20 min',
            rating: 4.0,
          ),
        ),
      ),
    );
  }
}
