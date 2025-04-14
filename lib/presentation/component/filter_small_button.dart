import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class FilterSmallButton extends StatelessWidget {
  final VoidCallback? onTap;

  const FilterSmallButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.tune_outlined, color: ColorStyles.white),
      ),
    );
  }
}
