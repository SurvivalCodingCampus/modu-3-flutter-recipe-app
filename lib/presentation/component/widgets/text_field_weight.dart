import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  Widget _buildLabeledField(String label, Widget textField) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 70,
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(child: textField),
      ],
    );
  }

  Widget _customTextField({bool filled = false, bool focus = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Label',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Focus(
          autofocus: focus,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Placeholder',
              filled: filled,
              fillColor: filled ? const Color(0xFFF4F4F4) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20), // 위쪽 간격 늘림
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'Input Field',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
          _buildLabeledField('Default', _customTextField()),
          const SizedBox(height: 20),
          _buildLabeledField('Focus', _customTextField(focus: true)),
          const SizedBox(height: 20),
          _buildLabeledField('Filled', _customTextField(filled: true)),
        ],
      ),
    );
  }
}