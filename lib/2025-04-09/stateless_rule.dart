import 'package:flutter/material.dart';

import '../domain/model/recipe.dart';
import '../presentation/component/recipe_widget.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: RecipeWidget(
          recipe: Recipe(name: '떡볶이', imageUrl: 'http://www.naver.com', userId: '1'),
          onTapName: (String name) {
            print('onTapName: $name');
          },
          onTapImageUrl: (Recipe recipe) {
            print('onTapImageUrl: ${recipe.imageUrl}');
          },
          onTap: (Recipe recipe) {
            print('onTap: ${recipe.toString()}');
          },
        ),
      ),
    ),
  );
}
