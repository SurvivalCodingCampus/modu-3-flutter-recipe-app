import 'package:flutter/material.dart';
import 'package:recipe_app/core/routing/router.dart';
import 'package:recipe_app/ui/color_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        scaffoldBackgroundColor: ColorStyles.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorStyles.white,
        ),
        appBarTheme: AppBarTheme(color: ColorStyles.white),
        // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      routerConfig: router,
    );
  }
}
