import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/components.dart';
import 'package:recipe_app/presentation/component/ingredient_item.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/ui/color_styles.dart';

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
                            onPressed: () => print('Big Button pressed'),
                          ),
                        ),
                        SizedBox(
                          width: 243,
                          child: MediumButton(
                            text: "Button",
                            onPressed: () => print('Medium Button pressed'),
                          ),
                        ),
                        SizedBox(
                          width: 174,
                          child: SmallButton(
                            text: "Button",
                            onPressed: () => print('Small Button pressed'),
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
                            print(index);
                          },
                        ),
                        MultiTab(
                          labels: ['Tab 1', 'Tab 2', 'Tab 3'],
                          selectedIndex: 2,
                          onValueChange: (index) {
                            print(index);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
