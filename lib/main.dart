import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/presentation/common/component/custom_tabs.dart';
import 'package:recipe_app/presentation/common/widget/button_page.dart';
import 'package:recipe_app/presentation/common/component/custom_input_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  int selectedIndex = 0;
  List<String> labels = ["Label1", "Label2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonPage(),
                  CustomInputField(labelString: 'labelTest'),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomTabs(
                      labels: labels,
                      selectedIndex: selectedIndex,
                      onValueChange: (selectedIndex) {
                        print(selectedIndex);
                      },
                    ),
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
