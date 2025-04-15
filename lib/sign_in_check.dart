import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/main/sign_in/sign_in.dart';
import 'package:recipe_app/presentation/main/sign_in/sign_in_state.dart';
import 'package:recipe_app/presentation/main/sign_in/sign_in_view_model.dart';

void main() {
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  final SignInViewModel viewModel = SignInViewModel();
  final SignInState state = SignInState();

  MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SignIn(viewModel: viewModel),
    );
  }
}
