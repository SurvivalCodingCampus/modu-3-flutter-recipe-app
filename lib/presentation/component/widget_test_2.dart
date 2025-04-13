import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/input_field.dart';
import 'package:recipe_app/presentation/component/medium_Button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

import '../../data/model/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IngredientItem(itemName: 'Tomatos',
                itemImageUrl: 'https://panettamercato.com.au/wp-content/uploads/2021/07/Tomatoes-Round-Kg-Panetta-Mercato.jpeg',
                itemWeight: '500g'),
            SizedBox(height: 16,),
            IngredientItem(itemName: 'Cabbage',
                itemImageUrl: 'https://lh5.googleusercontent.com/proxy/b1dxq3TmZJJjSKVQ7AgAaOeMG8uqWh64y8OEDbGQe0YC8KQBIrOyxhe7R2nzaxiDI2oHNygxwUmIxQiwsLIwTpKaOSGSP6WwaFZIPfgH-sM',
                itemWeight: '300g'),


            SizedBox(height: 16,),
            RecipeCard(recipe:
            Recipe(imageUrl: 'assets/images/food2.png',
                recipeName: 'Traditional spare big ribs baked',
                chefName: 'Alex lau',
                rating: 4.0,
                cookingTime: '20 min',
                isBookmarked: false)
                , onBookmarkChanged: (isBookmarked) {
                  print('Bookmark changed: $isBookmarked');
                }
            ),

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

            SizedBox(height: 16,),
            RatingDialog(
              title: "Rate recipe",
              actionName: "Send",
              onChange: (rating) {
                // 선택된 평점을 처리하는 코드
                print("선택된 평점: $rating");

              },
            ),


            SizedBox(height: 16,), // 공백 추가
            ElevatedButton(
              onPressed: () => _showRatingDialog(context),
              child: const Text('레시피 평가하기'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showRatingDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero, // 여백 제거
          content: RatingDialog(
            title: "Rate recipe",
            actionName: "Send",
            onChange: (rating) {
              // 선택된 평점을 처리하는 코드
              print("선택된 평점: $rating");
              // 다이얼로그 닫기
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}

