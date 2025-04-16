import 'package:flutter/material.dart';
import 'package:recipe_app/core/presentation/components/search_input.dart';
import 'package:recipe_app/ui/color_styles.dart';

class SearchZone extends StatelessWidget {
  final void Function(String value) onChange;
  final TextEditingController? controller;
  final VoidCallback onSettingsClick;
  final bool isMain;
  final VoidCallback? onTap;

  const SearchZone({
    super.key,
    required this.onChange,
    this.controller,
    this.isMain = false,
    required this.onSettingsClick,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SearchInput(
            onValueChange: onChange,
            controller: controller,
            isMain: isMain,
            onTap: onTap,
          ),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: onSettingsClick,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 50,
              height: 50,
              color: ColorStyle.primary100,
              child: const Icon(Icons.tune, color: ColorStyle.white),
            ),
          ),
        ),
      ],
    );
  }
}
