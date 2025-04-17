import 'package:flutter/material.dart';

import 'package:recipe_app/presentation/component/filter_button.dart';
import 'package:recipe_app/presentation/component/half_recipe_card.dart';
import 'package:recipe_app/presentation/search_recipes/search_recipes_state.dart';

import 'core/routing/router.dart';
import 'data/repository/recipe_repository_impl.dart';
import 'presentation/filter/filter_search_bottom_sheet.dart';
import 'presentation/search_recipes/search_recipes_screen.dart';
import 'presentation/search_recipes/search_recipes_view_model.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: router,
//     );
//   }
// }

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final searchRecipesViewModel = SearchRecipesViewModel(
      RecipeRepositoryImpl(),SearchRecipesState()
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SearchRecipesScreen(
            searchRecipesViewModel: searchRecipesViewModel,
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: SafeArea(
//           child: FilterButton(buttons: Button(text: '1')),
//         ),
//       ),
//     );
//   }
// }



