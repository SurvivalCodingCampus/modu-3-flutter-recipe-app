import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-09/presentation/component/big_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/input_field.dart';
import 'package:recipe_app/2025-04-09/presentation/component/small_button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/tabs.dart';
import 'package:recipe_app/2025-04-09/ui/color_styles.dart';
import 'package:recipe_app/2025-04-10/presentation/component/ingredient_item.dart';
import 'package:recipe_app/2025-04-10/presentation/component/rating_button.dart';
import 'package:recipe_app/2025-04-10/presentation/component/rating_dialog.dart';
import 'package:recipe_app/2025-04-10/presentation/component/recipe_card.dart';

import '2025-04-09/presentation/component/medium_button.dart';
import '2025-04-10/presentation/component/filter_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('UI 연습'),
          centerTitle: true,
          backgroundColor: ColorStyles.appBarColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingDialog(
                  onChange: (int) {
                    print(int);
                  },
                ),
                SizedBox(height: 16),
                RecipeCard(
                  imagePath: '../assets/images/bibimbop.png',
                  title: 'Traditional Korean Rice \n Food\n',
                  chef: 'Chef John',
                  minutes: 20,
                  rate: 4.0,
                ),
                SizedBox(height: 16),
                RatingButton(),
                SizedBox(height: 16),
                FilterButton(),
                SizedBox(height: 16),
                BigButton(
                  onClick: () {
                    print('빅버튼');
                  },
                ),
                SizedBox(height: 16),

                MediumButton(
                  onClick: () {
                    print('미디움버튼');
                  },
                ),
                SizedBox(height: 16),

                SmallButton(
                  onClick: () {
                    print('스몰버튼');
                  },
                ),
                SizedBox(height: 16),

                InputField(
                  onValueChange: (String) {
                    print('입력내용 $String');
                  },
                ),
                SizedBox(height: 16),

                Tabs(
                  selectedIndex: 0,
                  labels: ['Label1', 'Label2'],
                  onValueChange: (int) {
                    print('$int');
                  },
                ),
                SizedBox(height: 16),
                IngredientItem(
                  imagePath: '../assets/images/tomatoes.png',
                  ingredient: 'Tomatos',
                  amount: '500g',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
