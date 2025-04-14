import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';
import '../../../ui/text.dart';
import '../../data/model/ingredients.dart';
import '../../data/model/recipes.dart';


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: RecipeCard(
            recipe: Recipes(
              id: 1,
              name: 'Gopchang Jeongol',
              image: 'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
              chef: 'Bobae',
              time: '20 min',
              rating: 4.0,
              ingredients: <Ingredients>[], category: '',
            ),
          ),
        ),
        backgroundColor: ColorStyles.gray1,
      ),
    ),
  );
}

class RecipeCard extends StatelessWidget {
  final Recipes recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        height: 200,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            SizedBox.expand(
              // child: Image.asset(
              //   'assets/images/gopchangjeongol.png',
                child: Image.network(recipe.image,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 60,
                      height: 24,
                      child: Row(
                        children: [
                          Image.asset('assets/images/stopwatch.png',
                            width: 16,
                            height: 16,
                          ),
                          SizedBox(width: 4),
                          Text(recipe.time,
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 6),
                    Image.asset(
                      'assets/images/bookmark.png',
                      width: 24,
                      height: 24,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: 37,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ColorStyles.secondary20,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: ColorStyles.rating, size: 10),
                      Text(recipe.rating.toString(), style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      style: TextStyles.normalTextRegular.copyWith(color: Colors.white),
                    ),
                    Text(
                      'By ${recipe.chef}',
                      style: TextStyles.smallerTextRegular.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
