import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String text;
  final String hintText;
  final void Function(String value) onChanged;

  const InputField({
    super.key,
    required this.text,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.clear),
        labelText: text,
        hintText: hintText,
        helperText: 'supporting text',
        filled: true,
      ),
      onChanged: onChanged,
    );
  }
}
