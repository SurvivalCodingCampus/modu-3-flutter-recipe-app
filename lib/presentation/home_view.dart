import 'package:flutter/material.dart';
import 'package:recipe_app/model/ingredient.dart';
import 'package:recipe_app/model/recipe.dart';

import 'package:recipe_app/presentation/component/recipe_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Ingredient> items = [
    Ingredient(
      id: '1',
      name: 'Tomato',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBGQA-90wUSZLTbDOZRx82dfgbbWIR-JPFuw&s',
      weight: 500,
    ),
    Ingredient(
      id: '2',
      name: 'Cabbage',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0isXIBXi9gOEeS7YJ_BgHUijYl3na5K8PbQ&s',
      weight: 400,
    ),
    Ingredient(
      id: '3',
      name: 'Taco',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpQgdor4G2jrYMXlvISP00BL_BInU43jOblw&s',
      weight: 300,
    ),
  ];

  List<Recipe> recipes = [
    Recipe(
      id: '1',
      title: 'Taco',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmZw6XPQ46etY0sTf13hZW3Gi3z_63c-aZHQ&s',
      rate: 2.0,
      cookingTime: 15,
    ),
    Recipe(
      id: '2',
      title: 'Hamberger is very nice',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSJ94wG3vijhGRXiIa_Z__AvEnvpsdOtsQ_A&s',
      rate: 3.5,
      cookingTime: 5,
    ),
    Recipe(
      id: '3',
      title: 'Pizza',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaxVhAJD85NE9WNvuxfmutOJapD3EqHAuenQ&s',
      rate: 4.5,
      cookingTime: 20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(recipe: recipe);
        },
      ),
    );
  }
}
