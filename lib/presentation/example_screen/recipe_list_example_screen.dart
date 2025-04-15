import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/filter/filter_enum.dart';
import 'package:recipe_app/data/model/ingredient/ingredient.dart';
import 'package:recipe_app/data/model/media/media.dart';
import 'package:recipe_app/data/model/recipe/recipe.dart';
import 'package:recipe_app/data/model/user/user.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/ui/text_styles.dart';

class RecipeListExampleScreen extends StatelessWidget {
  const RecipeListExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Recipe> recipes = [
      Recipe(
        category: Category.breakfast,
        recipeId: 1,
        title: "Spice roasted chicken with flavored rice",
        ingredient: [
          Ingredient(imageUrl: 'imageUrl', name: 'name', weight: 20),
        ],
        time: 20,
        rating: 4.0,
        user: User(
          name: "Mark Kelvin",
          id: 1,
          email: 'test@email.com',
          userId: 'user1',
          address: "Lagos, Nigeria",
        ),
        media: Media(
          imageId: 'imageId',
          thumbNailUrl:
              "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
          imageUrl: 'imageUrl',
          recipeVideoUrl: 'recipeVideoUrl',
        ),
        createdAt: DateTime.now(),
        userName: 'Mark Kelvin',
        thumbNailUrl:
            "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
      ),
      Recipe(
        category: Category.breakfast,
        recipeId: 2,
        title: "Spice roasted chicken with flavored rice",
        ingredient: [
          Ingredient(imageUrl: 'imageUrl', name: 'name', weight: 20),
        ],
        time: 20,
        rating: 4.0,
        user: User(
          name: "Mark Kelvin",
          id: 1,
          email: 'test@email.com',
          userId: 'user1',
          address: "Lagos, Nigeria",
        ),
        media: Media(
          imageId: 'imageId',
          thumbNailUrl:
              "https://cdn.pixabay.com/photo/2019/09/07/19/02/spanish-paella-4459519_1280.jpg",
          imageUrl: 'imageUrl',
          recipeVideoUrl: 'recipeVideoUrl',
        ),
        createdAt: DateTime.now(),
        userName: 'Mark Kelvin',
        thumbNailUrl:
            "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
      ),
      Recipe(
        category: Category.breakfast,
        recipeId: 3,
        title: "Spice roasted chicken with flavored rice",
        ingredient: [
          Ingredient(imageUrl: 'imageUrl', name: 'name', weight: 20),
        ],
        time: 20,
        rating: 4.0,
        user: User(
          name: "Mark Kelvin",
          id: 1,
          email: 'test@email.com',
          userId: 'user1',
          address: "Lagos, Nigeria",
        ),
        media: Media(
          imageId: 'imageId',
          thumbNailUrl:
              "https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_1280.jpg",
          imageUrl: 'imageUrl',
          recipeVideoUrl: 'recipeVideoUrl',
        ),
        createdAt: DateTime.now(),
        userName: 'Mark Kelvin',
        thumbNailUrl:
            "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
      ),
      Recipe(
        category: Category.breakfast,
        recipeId: 4,
        title: "Spice roasted chicken with flavored rice",
        ingredient: [
          Ingredient(imageUrl: 'imageUrl', name: 'name', weight: 20),
        ],
        time: 20,
        rating: 4.0,
        user: User(
          name: "Mark Kelvin",
          id: 1,
          email: 'test@email.com',
          userId: 'user1',
          address: "Lagos, Nigeria",
        ),
        media: Media(
          imageId: 'imageId',
          thumbNailUrl:
              "https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_1280.jpg",
          imageUrl: 'imageUrl',
          recipeVideoUrl: 'recipeVideoUrl',
        ),
        createdAt: DateTime.now(),
        userName: 'Mark Kelvin',
        thumbNailUrl:
            "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
      ),
      Recipe(
        category: Category.breakfast,
        recipeId: 5,
        title: "Spice roasted chicken with flavored rice",
        ingredient: [
          Ingredient(imageUrl: 'imageUrl', name: 'name', weight: 20),
        ],
        time: 20,
        rating: 4.0,
        user: User(
          name: "Mark Kelvin",
          id: 1,
          email: 'test@email.com',
          userId: 'user1',
          address: "Lagos, Nigeria",
        ),
        media: Media(
          imageId: 'imageId',
          thumbNailUrl:
              "https://cdn.pixabay.com/photo/2016/11/22/18/52/cake-1850011_1280.jpg",
          imageUrl: 'imageUrl',
          recipeVideoUrl: 'recipeVideoUrl',
        ),
        createdAt: DateTime.now(),
        userName: 'Mark Kelvin',
        thumbNailUrl:
            "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('RecipeCard 미리보기', style: AppTextStyles.largeBold()),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RecipeCard(recipe: recipes[index]),
          );
        },
      ),
    );
  }
}
