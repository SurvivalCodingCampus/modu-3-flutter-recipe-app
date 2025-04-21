import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/main/sign_in/sign_in_state.dart';
import 'package:recipe_app/presentation/main/sign_in/sign_in_view_model.dart';

import 'core/di/get_it.dart';
import 'core/routing/router.dart';

void main() {
  diSetup();
  runApp(MyRecipeApp());
}

class MyRecipeApp extends StatelessWidget {
  final SignInViewModel viewModel = SignInViewModel();
  final SignInState state = SignInState();

  MyRecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipe App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: router,
    );
  }
}
