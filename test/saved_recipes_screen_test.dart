

// void main() {
//   MockRecipeDataImpl mockRecipeDataImpl = MockRecipeDataImpl();
//   RecipeRepository repository = RecipeRepositoryImpl(
//     recipeDataSource: mockRecipeDataImpl,
//   );
//   testWidgets('SavedRecipesScreen Check Test', (WidgetTester tester) async {
//     await tester.pumpWidget(
//       MaterialApp(
//         home: Scaffold(
//           body: SavedRecipesScreen(
//             savedRecipesViewModel: SavedRecipesViewModel(repository)
//               ..loadRecipesData(),
//           ),
//         ),
//       ),
//     );
//     expect(find.byType(SavedRecipesScreen), findsOneWidget);
//   });
// }
