import 'package:flutter/material.dart';
import 'package:recipe_app/data/data_source/mock_recipe_data_source_impl.dart';
import 'package:recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:recipe_app/domain/model/model.dart';
import 'package:recipe_app/presentation/search/search_screen.dart';
import 'package:recipe_app/presentation/search/search_view_model.dart';
import 'package:recipe_app/presentation/sign-in/sign_in_screen.dart';
import 'package:recipe_app/presentation/sign-up/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: SignUpScreen(onTapSignIn: () {}),
    );
  }
}
