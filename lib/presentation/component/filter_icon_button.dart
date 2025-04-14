import 'package:flutter/material.dart';
import 'package:recipe_app/ui/ui.dart';

class FilterIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  const FilterIconButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorStyles.primary100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset('assets/icons/filter.png', width: 20, height: 20),
      ),
    );
  }
}
