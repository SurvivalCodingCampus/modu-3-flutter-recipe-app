import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/button/big_button.dart';
import 'package:recipe_app/presentation/component/button/enum/button_type.dart';
import 'package:recipe_app/presentation/component/button/medium_button.dart';
import 'package:recipe_app/presentation/component/button/small_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> stars = ['5', '4', '3', '2', '1'];
  List<String> filters = ['All', 'Newest', 'Oldest', 'Popularity'];
  List<String> categorys = [
    'All',
    'Cereal',
    'Vegetables',
    'Dinner',
    'Chinese',
    'Local Dish',
    'Fruit',
    'BreakFast',
    'Spanish',
    'Lunch',
  ];
  Set<String> seleted = {};
  ButtonType buttonType = ButtonType.standard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigButton(
            text: 'Button',
            onTap: () {
              print('버튼');
            },
          ),
          MediumButton(
            text: 'Button',
            onTap: () {
              print('버튼');
            },
          ),
          SmallButton(
            text: 'Button',
            onTap: () {
              print('버튼');
            },
          ),
        ],
      ),
    );
  }
}
