import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/button/big_button.dart';
import 'package:recipe_app/presentation/component/button/enum/button_type.dart';
import 'package:recipe_app/presentation/component/button/medium_button.dart';
import 'package:recipe_app/presentation/component/button/small_button.dart';
import 'package:recipe_app/presentation/component/rating.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeScreen> {
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
  ButtonType currentType = ButtonType.standard;
  int starIndex = 0;

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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Rating(
                        title: 'Rate Recipe',
                        actionName: 'Send',
                        onChange: (index) {
                          print(index);
                        },
                      ),
                ),
              );
            },
            child: const Icon(Icons.ac_unit_sharp),
          ),
        ],
      ),
    );
  }
}
