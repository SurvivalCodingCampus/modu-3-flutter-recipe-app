import 'package:flutter/material.dart';
import 'package:recipe_app/core/di/di_setup.dart';

import 'core/routing/router.dart';

void main() {

  diSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Premium Recipe',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white, // 기본이 white 이긴함
        // 앱 전체에서 divider 색상을 투명하게 설정 for 네비게이션바
        //dividerColor: Colors.transparent,
      ),
    );
  }
}



