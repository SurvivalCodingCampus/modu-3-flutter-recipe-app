import 'package:flutter/material.dart';
import 'package:recipe_app/test_screen/component_test_screen.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: ColorStyles.white,
        // textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: ComponentTestScreen(),
    );
  }
}
