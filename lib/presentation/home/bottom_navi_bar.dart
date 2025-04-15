import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../router/routes.dart';



class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({super.key});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int currentIndex = 0;

  // void ChangeTab(int index) {
  //   switch (v) {
  //     case 0 :
  //       context.go(Routes.home);
  //       break;
  //     case 1 :
  //       context.go(Routes.);
  //       break;
  //     case 2 :
  //       context.go(Routes.home);
  //       break;
  //     case 3 :
  //       context.go(Routes.home);
  //       break;
  //   }
  //   setState(() {
  //     currentIndex = v;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
