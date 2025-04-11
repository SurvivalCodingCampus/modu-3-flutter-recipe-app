import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/ingredient.dart';
import 'package:recipe_app/data/model/recipe.dart';
import 'package:recipe_app/data/model/user.dart';
import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/input_field_widget.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/component/tabs_widget.dart';
import 'package:recipe_app/ui/color_styles.dart';
import 'package:recipe_app/ui/text_styles.dart';

import 'component/button_widget.dart';
import 'component/ingredient_item.dart';
import 'component/rating_dialog.dart';
import 'component/recipe_card.dart';

class ComponentTestScreen extends StatefulWidget {
  const ComponentTestScreen({super.key});

  static const List<Recipe> recipes = [
    Recipe(
      recipeId: 1,
      name: 'Traditional spare ribs baked',
      cookTime: '20 min',
      chef: User(name: 'Chef John'),
      rate: 4.0,
      foodImage: 'assets/images/recipe_images/Traditional spare ribs baked.png',
    ),
  ];
  static const List<Ingredient> ingredients = [
    Ingredient(
      name: 'Tomatos',
      weight: '500g',
      ingredientImage: 'assets/images/ingredient_images/tomato.png',
    ),
  ];

  @override
  State<ComponentTestScreen> createState() => _ComponentTestScreenState();
}

class _ComponentTestScreenState extends State<ComponentTestScreen> {

  int tabSelectedIndex = 0;

  bool isBookmarked = false;
  bool isRatingButtonSelected = false;
  bool isFilterButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text('📌 컴포넌트 페이지', style: TextStyles.largeBold()),
            centerTitle: true,
            backgroundColor: ColorStyles.white,
        ),
        backgroundColor: ColorStyles.white,
        body: SingleChildScrollView(
          child: Padding(
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
                        setState(() {
                          tabSelectedIndex = index;
                        });
                      },
                      labels: ['Label0', 'Label1'],
                      selectedIndex: tabSelectedIndex,
                    ),
                  ),
                  IngredientItem(ingredient: ComponentTestScreen.ingredients.first),
                  SizedBox(
                    height: 200,
                    child: RecipeCard(
                      recipe: ComponentTestScreen.recipes.first,
                      isBookmarked: isBookmarked,
                      onBookmark: (name) {
                        if (isBookmarked == true) {
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
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RatingButton(
                        text: '5',
                        isSelected: isRatingButtonSelected,
                        onClick: () {
                          setState(() {
                            isRatingButtonSelected = !isRatingButtonSelected;
                          });
                        },
                      ),
                      FilterButton(
                        text: 'Text',
                        isSelected: isFilterButtonSelected,
                        onClick: () {
                          setState(() {
                            isFilterButtonSelected = !isFilterButtonSelected;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ButtonWidget(
                    buttonSize: ButtonSize.medium,
                    buttonText: '⭐ 별점 주기',
                    onClick: () async {
                      await _showMyDialog();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          backgroundColor: ColorStyles.white,
          content: RatingDialog(
            title: 'Rate recipe',
            actionName: 'Send',
            onChange: (int rateValue) {
              print('별점: ${'⭐' * rateValue}');
              Navigator.of(context).pop();
            },
          ),
        );
      },
    );
  }
}
