import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class InputField extends StatefulWidget {
  final void Function(String value) onValueChange;

  final String titleLabel;
  final String inputValue;
  final FocusNode focusNode;

  const InputField({
    super.key,
    required this.titleLabel,
    required this.inputValue,
    required this.focusNode,
    required this.onValueChange,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool get isFocused => widget.focusNode.hasFocus;
  bool get hasText => widget.inputValue.trim().isNotEmpty;
  Color _textColor = ColorStyle.gray4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85, // 화면의 80%
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.titleLabel, style: AppTextStyles.smallRegular),
          SizedBox(height: 8),
          TextField(
            //controller: controller,
            focusNode: widget.focusNode,
            enableInteractiveSelection: false,
            onSubmitted: (value) {
              widget.onValueChange(value);
            },
            onTapOutside: (event) {

            },
            onChanged: (value) {
              _textColor =
              value.trim().isEmpty ? ColorStyle.gray4 : ColorStyle.black;
              widget.onValueChange(value);
            },
            decoration: InputDecoration(
              hintText: isFocused || hasText ? '' : 'Placeholder',
              hintStyle: AppTextStyles.smallRegular.copyWith(color: _textColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorStyle.gray4, width: 1.5),
              ),
              // 포커스
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorStyle.primary80, width: 1.5),
              ),
              // 비활성화(enabled: false)
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorStyle.gray4, width: 1.5),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
