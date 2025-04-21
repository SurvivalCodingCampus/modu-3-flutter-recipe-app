import 'package:flutter/material.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/presentation/widgets/textfield/app_textfield.dart';

class SearchTextfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final bool enabled;
  const SearchTextfield({
    required this.controller,
    required this.onChanged,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      enabled: enabled,
      prefixIcon: const Icon(Icons.search, color: AppColor.grey4),
      onChanged: onChanged,
      contentPadding: const EdgeInsets.all(8),
      controller: controller,
      hintText: 'Search recipe',
    );
  }
}
