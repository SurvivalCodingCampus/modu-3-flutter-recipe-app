import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app/core/style/app_color.dart';
import 'package:recipe_app/core/style/app_textstyle.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecure;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool expands;
  final int? maxLines;
  final double borderRadius;
  final TextStyle? style;
  final Color? fillColor;
  final Color? borderColor;
  final EdgeInsets? contentPadding;
  final bool isDense;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final Color? textColor;
  const AppTextField({
    required this.controller,
    required this.hintText,
    this.onTap,
    this.borderRadius = 10,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.readOnly = false,
    this.obsecure = false,
    this.expands = false,
    this.isDense = false,
    this.maxLines,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.inputFormatters,
    this.style,
    this.fillColor,
    this.borderColor,
    this.contentPadding,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      maxLines: maxLines,
      expands: expands,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      readOnly: readOnly,
      enabled: enabled,
      obscureText: obsecure,
      textAlign: textAlign,
      textAlignVertical: TextAlignVertical.top,
      style: AppTextStyle.smallRegular,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        isDense: isDense,
        counterText: '',
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 0),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        hintText: hintText,
        hintStyle: AppTextStyle.smallRegular.copyWith(color: textColor),
        enabledBorder: OutlineInputBorder(
          borderSide:
              borderColor != null
                  ? BorderSide(color: borderColor!)
                  : const BorderSide(),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: AppColor.primary80),
        ),
        focusColor: Colors.black,
      ),
    );
  }
}
