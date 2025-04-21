import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

class SearchInput extends StatelessWidget {
  final String hintText;
  final Function(String query) onSubmitted;
  final VoidCallback onTap;

  const SearchInput({
    super.key,
    required this.hintText,
    required this.onSubmitted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        onSubmitted: onSubmitted,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          hintStyle: const TextStyle(color: ColorStyles.gray3),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: ColorStyles.gray3, width: 1.3),
          ),
          prefixIcon: const Icon(Icons.search, color: ColorStyles.gray3),
        ),
      ),
    );
  }
}
