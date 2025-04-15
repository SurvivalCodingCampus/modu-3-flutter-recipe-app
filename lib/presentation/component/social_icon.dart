import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class SocialIcon extends StatelessWidget {
  final String iconPath;

  const SocialIcon({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: ColorStyles.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: ColorStyles.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Image.asset(iconPath),
    );
  }
}
