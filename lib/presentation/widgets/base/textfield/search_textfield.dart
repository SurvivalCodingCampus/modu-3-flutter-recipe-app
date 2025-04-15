import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/presentation/widgets/base/textfield/app_textfield.dart';

class SearchTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  const SearchTextfield({
    required this.controller,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      prefixIcon: const Icon(Icons.search, color: AppColor.grey4),
      onChanged: onChanged,
      contentPadding: const EdgeInsets.all(8),
      controller: controller,
      hintText: 'Search recipe',
    );
  }
}
