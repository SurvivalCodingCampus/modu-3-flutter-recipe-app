import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_button.dart';
import 'package:recipe_app/presentation/component/label_input_field.dart';
import 'package:recipe_app/presentation/component/medium_button.dart';
import 'package:recipe_app/presentation/component/small_button.dart';
import 'package:recipe_app/presentation/component/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const ComponentsWidget(),
    );
  }
}

class ComponentsWidget extends StatelessWidget {
  const ComponentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                BigButton(
                  text: 'Button',
                  onTap: () {
                    print('Big Button Pressed');
                  },
                ),
                const SizedBox(height: 10),
                MediumButton(
                  text: 'Button',
                  onTap: () {
                    print('Medium Button Pressed');
                  },
                ),
                const SizedBox(height: 10),
                SmallButton(
                  text: 'Button',
                  onTap: () {
                    print('Small Button Pressed');
                  },
                ),
                const SizedBox(height: 10),
                LabelInputField(
                  label: 'label',
                  hintText: 'hintText',
                  onValueChange: (String value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 10),
                Tabs(
                  labels: const ['one', 'two', 'three'],
                  selectedIndex: 0,
                  onTap: (int index) {
                    print(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
