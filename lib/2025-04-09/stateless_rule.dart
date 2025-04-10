import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: RecipeWidget(
          recipe: Recipe(name: '떡볶이', imageUrl: 'naver.com'),
          onTapName: (String name) {
            print('onTapName: $name');
          },
          onTapImageUrl: (Recipe recipe) {
            print('onTapImageUrl: ${recipe.imageUrl}');
          },
          onTap: (Recipe recipe) {
            print('onTapContainer: ${recipe.toString()}');
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
  final void Function(String name)? onTapName;
  final void Function(Recipe recipe)? onTapImageUrl;
  final void Function(Recipe recipe)? onTap;

  final Recipe recipe;

  const RecipeWidget({
    super.key,
    required this.recipe,
    this.onTapName,
    this.onTapImageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          onTap?.call(recipe);
        },
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  onTapName?.call(recipe.name);
                },
                child: Text(
                  recipe.name,
                  style: TextStyle(fontSize: 40),
                  key: Key('name'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onTapImageUrl?.call(recipe);
                },
                child: Text(recipe.imageUrl, style: TextStyle(fontSize: 40)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
