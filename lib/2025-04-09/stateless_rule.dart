import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: RecipeWidget(
          recipe: Recipe(name: '떡볶이', imageUrl: 'dddd'),
          onTabName: (name) {
            print('Tapped on: $name');
          },
          onTabImageUrl: (Recipe recipe) {
            print('onTapImageUrl: $recipe');
          }, onTab: (Recipe recipe) {
          print('onTap: $recipe');
        },
        ),
      ),
    ),
  );
}

class Recipe {
  final String name;
  final String imageUrl;

  const Recipe({required this.name, required this.imageUrl});
}

class RecipeWidget extends StatelessWidget {
  final void Function(String name) onTabName;
  final void Function(Recipe recipe) onTabImageUrl;
  final void Function(Recipe recipe) onTab;

  final Recipe recipe;

  const RecipeWidget({
    super.key,
    required this.recipe,
    required this.onTabName,
    required this.onTabImageUrl, required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              onTabName(recipe.name);
              print('touch'); // 터치 시 콜백 실행
            },
            child: Text(recipe.name,
            key: const Key('name'),),
          ),
          GestureDetector(
            onTap: () {
              onTabImageUrl(recipe);

            },
            child: Text(recipe.imageUrl),
          ),
        ],
      ),
    );
  }
}
