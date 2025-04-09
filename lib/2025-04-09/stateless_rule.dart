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
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  onTapName?.call(recipe.name);
                },
                child: Row(
                  children: [
                    Icon(Icons.arrow_forward),
                    Text(
                      recipe.name,
                      style: TextStyle(fontSize: 40),
                      key: const Key('name'),
                    ),
                  ],
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
