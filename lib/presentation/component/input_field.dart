import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_style.dart';
import 'package:recipe_app/ui/text_style.dart';

class InputField extends StatefulWidget {
  final String labelTitle;
  final String placeholderText;
  final String value;
  final Widget? iconWidget;
  final double? height;
  final double? inputHorizontalPadding;
  final void Function(String)? onValueChange;

  const InputField({
    super.key,
    required this.labelTitle,
    required this.placeholderText,
    required this.value,
    this.onValueChange,
    this.iconWidget,
    this.height = 55,
    this.inputHorizontalPadding = 20,
  });

  @override
  State<InputField> createState() => _InputFieldState();

  static Widget searchIcon() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 11),
      child: Icon(Icons.search, color: ColorStyle.gray4, size: 20),
    );
  }
}

class _InputFieldState extends State<InputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant InputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && _controller.text != widget.value) {
      _controller.text = widget.value;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.value.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 10.0;
    const double borderWidth = 1.5;
    const double labelSpacing = 8.0;

    return Column(
      children: [
        if (widget.labelTitle.isNotEmpty) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.labelTitle,
              style: AppTextStyles.smallRegular(color: ColorStyle.labelColour),
            ),
          ),
          const SizedBox(height: labelSpacing),
        ],
        SizedBox(
          height: widget.height,
          child: TextField(
            controller: _controller,
            onChanged: widget.onValueChange,
            style: AppTextStyles.extraSmallRegular(color: ColorStyle.black),
            decoration: InputDecoration(
              hintText: widget.placeholderText,
              hintStyle: AppTextStyles.smallRegular(color: ColorStyle.gray4),
              filled: true,
              fillColor: ColorStyle.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.inputHorizontalPadding ?? 0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: ColorStyle.gray4,
                  width: borderWidth,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: ColorStyle.primary80,
                  width: borderWidth,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: const BorderSide(
                  color: ColorStyle.gray4,
                  width: borderWidth,
                ),
              ),
              prefixIcon: widget.iconWidget,
            ),
          ),
        ),
      ],
    );
  }
}
