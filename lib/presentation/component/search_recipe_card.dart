
import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

import '../../data/model/recipes.dart';
import '../../ui/text.dart';

class SearchRecipeCard extends StatelessWidget {
  final Recipes recipe;

  const SearchRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(recipe.image,
            fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.topRight,
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
                  Icon(Icons.star,color: ColorStyles.rating, size: 10),
                  Text(recipe.rating.toString(), style: TextStyle(fontSize: 10),),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
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
        ],
      ),
    );
  }
}
