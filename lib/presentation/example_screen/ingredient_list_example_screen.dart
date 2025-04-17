import 'package:flutter/material.dart';
import 'package:recipe_app/domain/model/ingredient/ingredient.dart';
import 'package:recipe_app/core/component/ingredient_item.dart';
import 'package:recipe_app/core/ui_styles/text_styles.dart';

class IngredientListExampleScreen extends StatelessWidget {
  const IngredientListExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Ingredient> ingredients = [
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg",
        name: 'Tomatos',
        weight: 100,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg",
        name: 'Onion',
        weight: 50,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2014/11/28/19/10/lump-sugar-549096_1280.jpg",
        name: 'Sugar',
        weight: 100,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg",
        name: 'Pepper',
        weight: 50,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg",
        name: 'Chicken',
        weight: 100,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2020/01/02/01/43/avocado-4734786_1280.jpg",
        name: 'Avocado',
        weight: 50,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg",
        name: 'Pepper',
        weight: 100,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg",
        name: 'Rice',
        weight: 50,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg",
        name: 'Pork',
        weight: 100,
      ),
      Ingredient(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/01/21/18/08/meet-1154341_1280.png",
        name: 'Beef',
        weight: 50,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('IngredientItem 미리보기', style: AppTextStyles.largeBold()),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: IngredientItem(ingredient: ingredients[index]),
          );
        },
      ),
    );
  }
}
