import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-09/presentation/component/button.dart';
import 'package:recipe_app/2025-04-09/presentation/component/input_field.dart';
import 'package:recipe_app/2025-04-09/presentation/component/tabs.dart';
import 'package:recipe_app/presentation/component/rating_button.dart';
import 'package:recipe_app/presentation/component/rating_dialog.dart';
import 'package:recipe_app/presentation/component/recipe_card.dart';
import 'package:recipe_app/ui/color.dart';

import 'buttons.dart';
import 'filter_button.dart';
import 'ingredientItem.dart';



class Component extends StatefulWidget {
  const Component({super.key});

  @override
  State<Component> createState() => _ComponentState();
}

class _ComponentState extends State<Component> {
  int selectedValue = 0;
  String? inputText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ButtonsWidget(onClick: () {}),
              const SizedBox(height: 10),
              Buttons(onClick: () {},buttonName: '',),
              const SizedBox(height: 10),
              InputWidget(
                onValueChange: (value) {
                  inputText = value;
                  print('입력: $inputText');
                },
              ),
              const SizedBox(height: 10),
              TabsWidget(
                labels: ['1', '2'],
                selectedindex: 0,
                onValueChange: (value) {
                  selectedValue = value;
                },
              ),
              const SizedBox(height: 10),
              TabsWidget(
                labels: ['1', '2', '3'],
                selectedindex: 2,
                onValueChange: (value) {
                  selectedValue = value;
                },
              ),
              const SizedBox(height: 10),
              Ingredientitem(),
              const SizedBox(height: 10),
              // RecipeCard(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RatingButton(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: FilterButton(text: '아무거나'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context) => RatingDialog(onchange: (int) {

                        })
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: ColorStyles.primary100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:Text('별점 주기',
                        style: TextStyle(
                          color: ColorStyles.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              )
              // RatingDialog(onchange: (int ) {},),
            ],
          ),
        ),
      ),
    );
  }
}
