import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/midium_button.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/presentation/component/score_dialog.dart'; 
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/text_field_weight.dart';
import 'package:recipe_app/presentation/component/tab_selecter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  final List<String> labels = ['Label', 'Label'];

  void onValueChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('과제 제출')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                BigButton(),
                const SizedBox(height: 20),
                MidiumButton(),
                const SizedBox(height: 20),
                SmallButton(),
                const SizedBox(height: 10),
                TextFieldWidget(),
                const SizedBox(height: 30),
                TabSelector(
                  labels: labels,
                  selectedIndex: selectedIndex,
                  onValueChange: onValueChange,
                ),
                const SizedBox(height: 20),
                Container(
                  width: 315,
                  height: 76,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IngredientItem(
                    ingredientName: 'Tomatos',
                    ingredientImgUrl: 'assets/images/tomato.png',
                    ingredientWeight: 500,
                  ),
                ),
                const SizedBox(height: 20),
                RecipeCard(
                  recipeName: 'Traditional spare ribs\nbaked',
                  chefName: 'Chef John',
                  recipeImgUrl: 'assets/images/food1.png',
                  recipeTime: 20,
                  recipeRating: 4.0,
                ),
                const SizedBox(height: 20),
                FilterButtons(),
                const SizedBox(height: 20),
                RatingButton(),
                const SizedBox(height: 20),

                // ✅ 여기서 다이얼로그 버튼 대신 바로 위젯 보여주기
                ScoreDialog(
                  title: 'Rate recipe',
                  actionName: 'Send',
                  onChange: (score) {
                    print('선택된 점수: $score');
                  },
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}