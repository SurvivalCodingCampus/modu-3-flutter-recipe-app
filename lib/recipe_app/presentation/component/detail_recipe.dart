import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_app/data/model/recipe.dart';

class DetailRecipe extends StatelessWidget {
  final Recipe recipe;

  const DetailRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(recipe.name));
  }
}
