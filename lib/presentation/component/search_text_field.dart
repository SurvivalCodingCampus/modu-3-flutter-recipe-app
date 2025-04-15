// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:recipe_app/ui/ui.dart';

class SearchTextField extends StatefulWidget {
  final String placeholder;
  final Function(String value)? onValueChanged;

  const SearchTextField({
    super.key,
    required this.placeholder,
    this.onValueChanged,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: ColorStyles.gray1,
      onChanged: widget.onValueChanged,
      onTap: () {
        controller.clear();
        if (widget.onValueChanged != null) {
          widget.onValueChanged!('');
        }
      },
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        prefixIcon: Image.asset(
          'assets/icons/search.png',
          width: 18,
          height: 18,
        ),
        hintText: widget.placeholder,
        hintStyle: TextStyles.smallTextRegular.copyWith(
          color: ColorStyles.gray4,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 11,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorStyles.gray4),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorStyles.primary80),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
