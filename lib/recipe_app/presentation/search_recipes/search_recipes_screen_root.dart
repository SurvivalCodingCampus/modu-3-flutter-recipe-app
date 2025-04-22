// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_screen_event.dart';
// import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_state.dart';
// import 'package:recipe_app/recipe_app/presentation/search_recipes/search_recipes_view_model.dart';
//
// class SearchRecipesScreenRoot extends StatefulWidget {
//   SearchRecipesViewModel viewModel;
//
//   SearchRecipesScreenRoot({super.key, required this.viewModel});
//
//   @override
//   State<SearchRecipesScreenRoot> createState() => _SearchRecipesScreenRootState();
// }
//
// class _SearchRecipesScreenRootState extends State<SearchRecipesScreenRoot> {
//   SearchRecipesViewModel get vieModel => widget.viewModel;
//
//   SearchRecipesState get state => widget.viewModel.state;
//   StreamSubscription? _subscription;
//
//   @override
//   void initState() {
//     super.initState();
//     _subscription = vieModel.eventStream.listen((event) {
//       if (mounted) {
//         switch (event) {
//           case ShowSnackbar():
//             final snackBar = SnackBar(content: Text(event.message));
//             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         }
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _subscription?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return    ListenableBuilder(
//       listenable: Listenable.merge([
//         widget.searchRecipesViewModel,
//         widget.filterSearchViewModel,
//       ]),
//       builder: (context, child) {
//         final allRecipes =
//             widget
//                 .searchRecipesViewModel
//                 .searchRecipesState
//                 .recipes;
//         final filteredByCategory =
//             widget
//                 .filterSearchViewModel
//                 .filterSearchState
//                 .filteredRecipes;
//         List<dynamic> displayedRecipes;
//
//         if (keyword.isNotEmpty) {
//           displayedRecipes = allRecipes;
//         } else if (filteredByCategory.isNotEmpty) {
//           displayedRecipes = filteredByCategory;
//         } else {
//           displayedRecipes = allRecipes;
//         }
//
//         final size = MediaQuery.of(context).size;
//         final aspectRatio =
//         size.width > size.height ? 3 / 1 : 3 / 2;
//
//         return GridView.count(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: aspectRatio,
//           children:
//           displayedRecipes
//               .map(
//                 (recipe) => RecipeCard(
//               recipe: recipe,
//               showTimerAndBookmark: false,
//               onToggleBookMark: () {
//                 false;
//               },
//             ),
//           )
//               .toList(),
//         );
//       },
//     ),
//   }
// }
