import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/pages/splash_screen.dart';
import 'package:recipe_app/presentation/component/widgets/big_button.dart';
import 'package:recipe_app/presentation/component/widgets/filter_button.dart';
import 'package:recipe_app/presentation/component/widgets/ingredient_item.dart';
import 'package:recipe_app/presentation/component/widgets/midium_button.dart';
import 'package:recipe_app/presentation/component/widgets/rating_button.dart';
import 'package:recipe_app/presentation/component/widgets/recipe_card.dart';
import 'package:recipe_app/presentation/component/widgets/score_dialog.dart'; 
import 'package:recipe_app/presentation/component/widgets/small_button.dart';
import 'package:recipe_app/presentation/component/widgets/text_field_weight.dart';
import 'package:recipe_app/presentation/component/widgets/tab_selecter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

// 메인 콘텐츠 화면
class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int selectedIndex = 0;
  final List<String> labels = ['Label', 'Label'];

  void onValueChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('과제 제출')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              BigButton(),
              const SizedBox(height: 20),
              // MidiumButton(),
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
    );
  }
}