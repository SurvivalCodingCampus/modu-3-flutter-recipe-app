import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class InputField extends StatefulWidget {
  final String label;
  final String placeHolder;
  final TextEditingController controller;
  final Function(String) onValueChange;
  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    required this.onValueChange,
    required this.controller,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool islabel = widget.label.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (islabel) Text(widget.label, style: TextStyles.smallTextRegular),
        if (islabel) SizedBox(height: 5),
        SizedBox(
          height: 55,
          width: double.infinity,
          child: TextFormField(
            controller: _textEditingController,
            onChanged: (value) {
              print(value);
              widget.onValueChange(value);
            },
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: ColorStyles.gray4),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorStyles.gray4, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorStyles.primary80,
                  width: 1.5,
                ),
              ),
              hintText: widget.placeHolder,
              hintStyle: TextStyles.smallTextRegular.copyWith(
                color: ColorStyles.gray4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
