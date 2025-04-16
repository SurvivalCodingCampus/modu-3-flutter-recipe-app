import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color.dart';

import '../../data/model/ingredients.dart';



class Ingredientitem extends StatelessWidget {
  final Ingredients ingredients;

  const Ingredientitem({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 72,
          decoration: BoxDecoration(
            color: ColorStyles.gray4,
            borderRadius: BorderRadius.circular(20)

          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: Image.network(ingredients.ingredient.image,
                  width: 52,
                  height: 52,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(ingredients.ingredient.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(ingredients.amount.toString(),
                  style: TextStyle(
                    color: Colors.black38,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
