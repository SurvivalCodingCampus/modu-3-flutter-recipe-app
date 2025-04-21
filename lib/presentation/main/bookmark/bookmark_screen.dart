import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/di/di_setup.dart';

import '../../../core/routing/routes.dart';
import '../../../data/repository/mock_recipe_repository_impl.dart';
import '../../saved_recipes/saved_recipes_screen.dart';
import '../../saved_recipes/saved_recipes_view_model.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});
  @override
  Widget build(BuildContext context) {

    //build 완료 후 자동으로 라우팅
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go(Routes.savedRecipes);
    });

    //잠깐 보여줄 위젯
    return const SizedBox.shrink();


    //
  }
}