import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/media.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';

class RecipeCardScreen extends StatelessWidget {
  const RecipeCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User user1 = User(name: 'Chef John');
    final User user2 = User(name: 'Mark Kelvin');
    final Recipe recipe1 = Recipe(
      title: 'Traditional spare ribs baked',
      user: user1,
      cookingTime: '20 min',
      rate: 4.0,
      media: Media(imageUrl: 'assets/images/recipe1.png'),
    );
    final Recipe recipe2 = Recipe(
      title: 'spice roasted chicken with flavored rice',
      user: user2,
      cookingTime: '25 min',
      rate: 4.1,
      media: Media(imageUrl: 'assets/images/recipe2.png'),
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('레시피 카드')),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  RecipeCard(recipe: recipe1),
                  SizedBox(height: 24),
                  RecipeCard(recipe: recipe2),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
