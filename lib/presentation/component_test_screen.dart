import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/presentation/component/input_field_widget.dart';
import 'package:recipe_app/presentation/component/tabs_widget.dart';

import 'component/button_widget.dart';
import 'component/ingredient_item.dart';
import 'component/recipe_card.dart';

class ComponentTestScreen extends StatefulWidget {
  const ComponentTestScreen({super.key});

  @override
  State<ComponentTestScreen> createState() => _ComponentTestScreenState();
}

class _ComponentTestScreenState extends State<ComponentTestScreen> {

  final List<Recipe> recipes = [
    Recipe(
      recipeId: 1,
      name: 'Traditional spare ribs baked',
      cookTime: '20 min',
      chef: User(name: 'Chef John'),
      rate: 4.0,
      foodImage:
      'assets/images/recipe_images/Traditional spare ribs baked.png',
    ),
  ];
  final List<Ingredient> ingredients = [
    Ingredient(
      name: 'Tomatos',
      weight: '500g',
      ingredientImage: 'assets/images/ingredient_images/tomato.png',
    ),
  ];

  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('과제중...'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                ButtonWidget(
                  buttonSize: ButtonSize.big,
                  buttonText: 'Button',
                  onClick: () {
                    print('Big Button');
                  },
                ),
                ButtonWidget(
                  buttonSize: ButtonSize.medium,
                  buttonText: 'Button',
                  onClick: () {
                    print('Medium Button');
                  },
                ),
                ButtonWidget(
                  buttonSize: ButtonSize.small,
                  buttonText: 'Button',
                  onClick: () {
                    print('Small Button');
                  },
                ),
                InputFieldWidget(
                  label: 'Label',
                  placeHolder: 'PlaceHolder',
                  value: 'PlaceHolder',
                  onValueChange: (String value) {
                    print(value);
                  },
                ),
                SizedBox(
                  height: 55,
                  child: TabsWidget(
                    onValueChange: (index) {
                      print('index가 $index로 바뀌었습니다.');
                    },
                    labels: ['Label0', 'Label1'],
                    selectedIndex: 0,
                  ),
                ),
                IngredientItem(
                  ingredient: ingredients.first
                ),
                SizedBox(
                  height: 200,
                  child: RecipeCard(
                    recipe: recipes.first,
                    isBookmarked: isBookmarked,
                    onBookmark: (name) {
                      if(isBookmarked == true) {
                        print('$name 북마크가 해제 되었습니다');
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      } else {
                        print('$name이 북마크 되었습니다');
                        setState(() {
                          isBookmarked = !isBookmarked;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
