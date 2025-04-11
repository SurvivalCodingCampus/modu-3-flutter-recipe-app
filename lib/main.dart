import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

import 'utils/constant/default_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: DefaultRoute.routes,
      initialRoute: DefaultRoute.splash,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorStyle.primary60),
      ),
    );
  }
}
