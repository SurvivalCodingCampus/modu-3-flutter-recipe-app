import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/ui/color_styles.dart';
import 'package:recipe_app/presentation/ui/text_styles.dart';

class SearchInputField extends StatefulWidget {
  final void Function(String value) onValueChange;

  final TextEditingController controller;
  final FocusNode focusNode;
  final String titleLabel;

  const SearchInputField({
    super.key,
    required this.titleLabel,
    required this.controller,
    required this.focusNode,
    required this.onValueChange,
  });

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  bool get isFocused => widget.focusNode.hasFocus;

  bool get hasText => widget.controller.text.isNotEmpty;
  Color _textColor = ColorStyle.gray4;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width * 0.85, // 화면의 80%
      //height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(


            controller: widget.controller,
            focusNode: widget.focusNode,
            enableInteractiveSelection: false,
            onSubmitted: (value) {
              widget.onValueChange(value);
              setState(() {
                _textColor =
                    value.isEmpty ? ColorStyle.gray4 : ColorStyle.black;
              });
            },
            onTapOutside: (event) {
              widget.onValueChange(widget.controller.text);
            },
            onChanged: (value) {
              setState(() {
                _textColor =
                    value.isEmpty ? ColorStyle.gray4 : ColorStyle.black;
              });
            },
            decoration: InputDecoration(
              hintText: isFocused || hasText ? '' : 'Search recipe',
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              hintStyle: AppTextStyles.extraSmallRegular.copyWith(color: _textColor),

              prefixIcon: Padding(
                padding: EdgeInsets.all(12),
                child: Image.asset(
                  'assets/icons/search-normal.png',
                  width: 13,
                  height: 13,
                  fit: BoxFit.contain,
                ),
              ),
              prefixIconColor: ColorStyle.gray4,
              //search-normal.png
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorStyle.gray4, width: 1.5),
              ),
              // 포커스
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: ColorStyle.primary80, width: 1.5),
              ),
              focusColor: ColorStyle.primary80,

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
