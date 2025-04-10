import 'package:flutter/material.dart';

import 'package:recipe_app/presentation/component/input_field.dart';

import 'package:recipe_app/presentation/component/tabs.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int seletedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          InputField(
            label: 'label',
            placeholder: 'placeholder',
            onValueChange: (value) {
              print(value);
            },
          ),
          Tabs(
            labels: ['label1', 'label2'],
            onValueChange: (index) {
              setState(() {
                seletedIndex = index;
              });
            },
            selectedIndex: seletedIndex,
          ),
        ],
      ),
    );
  }
}
