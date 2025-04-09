import 'package:flutter/material.dart';
import 'package:recipe_app/2025-04-09/presentation/component/buttons.dart';
import 'package:recipe_app/2025-04-09/presentation/component/input_field.dart';
import 'package:recipe_app/2025-04-09/presentation/component/tabs.dart';



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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonsWidget(
              onClick: () {

              }
            ),
            const SizedBox(height: 10,),
            InputWidget(
              onValueChange: (value) {
                inputText = value;
              }
            ),
            const SizedBox(height: 10,),
            TabsWidget(
                labels: ['1','2'],
                selectedindex: 0,
                onValueChange: (value) {
                  selectedValue = value;
                }
            ),
            const SizedBox(height: 10,),
            TabsWidget(
              labels: ['1','2','3'],
              selectedindex: 2,
              onValueChange: (value) {
                selectedValue = value;
              }
            )
          ],
        ),
      ),
    );
  }
}

