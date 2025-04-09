import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: RecipeWidget(
          recipe: Recipe(name: '떡볶이', imageUrl: 'http://www.naver.com'),
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

class Recipe {
  final String name;
  final String imageUrl;

  const Recipe({required this.name, required this.imageUrl});
}

class RecipeWidget extends StatelessWidget {
  final void Function(String name) onTapName;
  final void Function(Recipe recipe) onTapImageUrl;
  final void Function(Recipe recipe) onTap;

  final Recipe recipe;

  const RecipeWidget({
    super.key,
    required this.recipe,
    required this.onTapName,
    required this.onTapImageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          onTap(recipe);
        },
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  onTapName(recipe.name);
                },
                child: Text(recipe.name, style: TextStyle(fontSize: 40)),
              ),
              GestureDetector(
                onTap: () {
                  onTapImageUrl(recipe);
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
