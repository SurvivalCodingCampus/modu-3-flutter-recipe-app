import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/big_button.dart';
import 'package:recipe_app/core/presentation/components/input_field.dart';
import 'package:recipe_app/core/presentation/components/medium_button.dart';
import 'package:recipe_app/core/presentation/components/multi_tabs.dart';
import 'package:recipe_app/core/presentation/components/small_button.dart';

class ComponentTestScreen extends StatefulWidget {
  const ComponentTestScreen({super.key});

  @override
  _ComponentTestScreenState createState() => _ComponentTestScreenState();
}

class _ComponentTestScreenState extends State<ComponentTestScreen> {
  int tabSelectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigButton(text: 'Big', onClick: () {}),
            const SizedBox(height: 10),
            MediumButton(text: 'medium', onClick: () {}),
            const SizedBox(height: 10),
            SmallButton(text: 'small', onClick: () {}),
            const SizedBox(height: 10),
            InputField(
              label: 'Label',
              value: 'value',
              placeHolder: 'place_holder',
              onValueChange: (value) {
                print(value);
              },
            ),
            const SizedBox(height: 10),
            MultiTabs(
              labels: ['Label1', 'Label2'],
              selectedIndex: tabSelectedValue,
              onValueChange: (value) {
                setState(() {
                  tabSelectedValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
