import 'package:flutter/material.dart';
import 'package:recipe_app/core/common/page_animation_move.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_screen.dart';
import 'package:recipe_app/presentation/page/saved_recipes/saved_recipes_view_model.dart';

class PageWapper extends StatelessWidget {
  const PageWapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                PageAnimationMove().pushWithFade(
                  context: context,
                  second: 2,
                  page: SavedRecipesScreen(
                    model: SavedRecipesViewModel()..fetchData(),
                  ),
                );
              },
              child: Text("saved recipes page"),
            ),

          ],
        ),
      ),
    );
  }
}
