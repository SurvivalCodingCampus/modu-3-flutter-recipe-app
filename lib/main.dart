import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/big_buttons.dart';
import 'package:recipe_app/presentation/component/midium_buttons.dart';
import 'package:recipe_app/presentation/component/small_buttons.dart';
import 'package:recipe_app/presentation/component/text_field_weight.dart';
import 'package:recipe_app/presentation/component/tab_selecter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;
  final List<String> labels = ['Label', 'Label'];

  void onValueChange(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('과제 제출')),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                BigButton(),
                const SizedBox(height: 20),
                MidiumButton(),
                const SizedBox(height: 20),
                SmallButton(),
                const SizedBox(height: 40),
                TextFieldWidget(),
                const SizedBox(height: 30),
                TabSelector(
                  labels: labels,
                  selectedIndex: selectedIndex,
                  onValueChange: onValueChange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}