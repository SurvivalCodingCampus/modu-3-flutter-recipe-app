import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/presentation/common/component/color_change_text_button.dart';
import 'package:recipe_app/presentation/common/component/color_text_button.dart';
import 'package:recipe_app/presentation/common/component/filter_button.dart';
import 'package:recipe_app/presentation/common/component/ingredient_item.dart';
import 'package:recipe_app/presentation/common/component/rating_button.dart';
import 'package:recipe_app/presentation/common/component/rating_card.dart';
import 'package:recipe_app/presentation/common/component/recipe_card.dart';
import 'package:recipe_app/presentation/common/enum/image_type.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';
import 'package:recipe_app/presentation/page/splash/splash_screen.dart';
import 'package:recipe_app/presentation/page/splash/splash_view_model.dart';

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
      home: SplashScreen(splashViewModel: SplashViewModel()..stateChange
        ()),
    );
  }
}

