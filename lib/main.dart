import 'package:flutter/material.dart';

import 'package:recipe_app/presentaiton/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentaiton/saved_recipes/saved_recipes_view_model.dart';

import 'data/repository/recipe_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SavedRecipesViewModel savedRecipesViewModel = SavedRecipesViewModel(RecipeRepositoryImpl());

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SavedRecipesScreen(savedRecipesViewModel: savedRecipesViewModel,),
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
//       home: SingleChildScrollView(
//         child: Scaffold(
//           body: SafeArea(
//             child: Center(
//               child: Column(
//                 children: [
//                   IngredientItem(
//                     ingredient: Ingredient(name: 'Tomatos', weight: 500),
//                   ),
//                   SizedBox(height: 20),
//                   RecipeCard(
//                     recipe: Recipe(
//                       title: '제목이용',
//                       author: '작성자용',
//                       cookTimes: 20,
//                       imageUrl: 'https://static.wtable.co.kr/image/production/service/recipe/2536/2f7aaf74-330a-4af6-ae12-b90c9d819f6c.jpg?size=800x800',
//                       rateStar: 4,
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       FilterButton(buttons: Button(text: '5')),
//                       SizedBox(width: 20),
//                       RatingButton(buttons: Button(text: 'text')),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   BigButtonsWidget(
//                     onClick: () {},
//                     buttons: Buttons(name: 'Button'),
//                   ),
//                   SizedBox(height: 20),
//                   MediumButtonsWidget(
//                     onClick: () {},
//                     buttons: Buttons(name: 'Button'),
//                   ),
//                   SizedBox(height: 20),
//                   SmallButtonsWidget(
//                     onClick: () {},
//                     buttons: Buttons(name: 'Button'),
//                   ),
//                   SizedBox(height: 20),
//
//                   RatingDialog(
//                     rating: Rating(
//                       title: 'Rate recipe',
//                       actionName: 'send',
//                       onChange: (value) {
//                         print('$value');
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
