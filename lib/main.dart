import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/buttons/select_button.dart';
import 'package:recipe_app/presentation/component/components.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/ui/color_styles.dart';

import 'presentation/component/rating_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorStyles.white,
        appBarTheme: AppBarTheme(backgroundColor: ColorStyles.white),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Recipe App')),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 315,
                            child: BigButton(
                              text: "Button",
                              onPressed: () => debugPrint('Big Button pressed'),
                            ),
                          ),
                          SizedBox(
                            width: 243,
                            child: MediumButton(
                              text: "Button",
                              onPressed:
                                  () => debugPrint('Medium Button pressed'),
                            ),
                          ),
                          SizedBox(
                            width: 174,
                            child: SmallButton(
                              text: "Button",
                              onPressed:
                                  () => debugPrint('Small Button pressed'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputField(
                            label: 'Label',
                            onValueChange: (value) {},
                            placeholder: 'Placeholder',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        spacing: 16,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MultiTab(
                            labels: ['Tab 1', 'Tab 2'],
                            onValueChange: (index) {
                              debugPrint('$index');
                            },
                          ),
                          MultiTab(
                            labels: ['Tab 1', 'Tab 2', 'Tab 3'],
                            selectedIndex: 2,
                            onValueChange: (index) {
                              debugPrint('$index');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      IngredientItem(
                        name: 'Tomato',
                        imagePath: 'assets/images/tomato.png',
                        weight: '100g',
                      ),
                      IngredientItem(
                        name: 'Cabbage',
                        imagePath: 'assets/images/cabbage.png',
                        weight: '300g',
                      ),
                      IngredientItem(
                        name: 'Taco',
                        imagePath: 'assets/images/taco.png',
                        weight: '1t',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      RecipeCard(
                        cookTime: 10,
                        title: 'spice roasted chicken  with flavored rice',
                        imagePath: 'assets/images/card-1.png',
                        rating: 4,
                        author: 'Mark Kelvin',
                        onBookmark: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      RecipeCard(
                        cookTime: 10,
                        title: 'Traditional spare ribs baked',
                        imagePath: 'assets/images/card-2.png',
                        rating: 4,
                        author: 'Mark Kelvin',
                        onBookmark: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      RecipeCard(
                        cookTime: 10,
                        title: 'Spicy fried rice mix chicken bali',
                        imagePath: 'assets/images/card-3.png',
                        rating: 4,
                        author: 'Mark Kelvin',
                        onBookmark: () {},
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            spacing: 5,
                            children: [
                              SelectButton(
                                icon: Icons.star,
                                text: '5',
                                onTap: () {},
                              ),
                              SelectButton(
                                icon: Icons.star,
                                text: '5',
                                onTap: () {},
                              ),
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              SelectButton(text: 'Text', onTap: () {}),
                              SelectButton(text: 'Text', onTap: () {}),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RatingDialog(
                        title: 'Default Rate recipe',
                        buttonName: 'Send',
                        onSubmit: (int rating) => debugPrint('$rating'),
                      ),
                      RatingDialog(
                        title: 'Active Rate recipe',
                        buttonName: 'Submit',
                        onSubmit: (int rating) => debugPrint('$rating'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
