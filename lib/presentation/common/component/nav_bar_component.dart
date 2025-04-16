import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/presentation/common/ui/color_style.dart';

class NavBarComponent extends StatelessWidget {
  final String? nowPageState;
  const NavBarComponent({super.key, required this.nowPageState});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 106,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A696969),
            offset: Offset(0, 0),
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Row(
        spacing: 40,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(),
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: Image.asset(
              nowPageState == "/home"
                  ? 'assets/icons/home_act.png'
                  : 'assets/icons/home.png',
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/saved-recipes");
            },
            icon: Image.asset(
              nowPageState == "/saved-recipes"
                  ? 'assets/icons/bookmark_act.png'
                  : 'assets/icons/bookmark.png',
            ),
          ),
        ],
      ),
    );
  }
}
