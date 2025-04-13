import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/medium_Button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

import '../../data/model/recipe.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IngredientItem(itemName: 'Tomatos', itemImageUrl: 'https://panettamercato.com.au/wp-content/uploads/2021/07/Tomatoes-Round-Kg-Panetta-Mercato.jpeg', itemWeight: '500g'),
            SizedBox(height: 16,),
            IngredientItem(itemName: 'Cabbage', itemImageUrl: 'https://lh5.googleusercontent.com/proxy/b1dxq3TmZJJjSKVQ7AgAaOeMG8uqWh64y8OEDbGQe0YC8KQBIrOyxhe7R2nzaxiDI2oHNygxwUmIxQiwsLIwTpKaOSGSP6WwaFZIPfgH-sM', itemWeight: '300g'),


            SizedBox(height: 16,),
            RecipeCard( recipe:
              Recipe(imageUrl: 'https://assets.bonappetit.com/photos/5e7a6c79edf206000862e452/16:9/w_2287,h_1286,c_limit/Cooking-Home-Collection.jpg',
              recipeName:  'Traditional spare big ribs baked',
              chefName:  'Alex lau',
              rating:  4.0,
              cookingTime:  '20 min',
              isBookmarked:  false)
              , onBookmarkChanged: (isBookmarked) {
              print('Bookmark changed: $isBookmarked');
              }
            ),



            SizedBox(height: 16,),
            // RecipeCard(
            //   imageUrl: 'https://c.ndtvimg.com/2018-12/9c7qbvm_turkey_625x300_13_December_18.jpg',
            //   recipeName: 'Roast Turkey with Cranberry Sauce Recipe',
            //   chefName: 'Lokesh Jarodia',
            //   rating: 3.2,
            //   cookingTime: '50 min',
            //   isBookmarked: true,
            //   onBookmarkChanged: (isBookmarked) {
            //    북마크 상태가 변경되었을 때 수행할 작업
            //     print('Bookmark changed: $isBookmarked');
            //   },
            // ),

            SizedBox(height: 16,), // 공백 추가
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingButton(
                  number: '5',
                  onPressed: (isSelected) {
                    print('Button selected: $isSelected');
                  },
                  isSelected: false,
                ),
                SizedBox(width: 16,),
                RatingButton(
                  number: '4',
                  onPressed: (isSelected) {
                    print('Button selected: $isSelected');
                  },
                  isSelected: true,
                ),
                SizedBox(width: 16,),
                FilterButton(
                  lable: 'All',
                  onPressed: (isSelected) {
                    print('Button selected: $isSelected');
                  },
                  isSelected: false,
                ),
                SizedBox(width: 16,),
                FilterButton(
                  lable: 'Cereal',
                  onPressed: (isSelected) {
                    print('Button selected: $isSelected');
                  },
                  isSelected: true,
                ),
                SizedBox(width: 16,),
                FilterButton(
                  lable: 'Fruit',
                  onPressed: (isSelected) {
                    print('Button selected: $isSelected');
                  },
                  isSelected: false,
                ),
              ],
            ),

            SizedBox(height: 16,),
            BigButton(lable: 'Button',
              onClick: () {
                print('BigButtonTest');
              },
            ),
            SizedBox(height: 16,), // 공백 추가
            MediumButton(lable: 'Button',
              onClick: () {
                print('MediumButtonTest');
              },
            ),
            SizedBox(height: 16,), // 공백 추가
            SmallButton(lable: 'Button',
              onClick: () {
                print('SmallButtonTest');
              },
            ),

          ],
        ),
      ),
    ),
  );
}