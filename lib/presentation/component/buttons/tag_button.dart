import 'package:flutter/material.dart';
import 'package:recipe_app/ui/color_styles.dart';

class TagButton extends StatefulWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const TagButton({
    super.key,
    this.isSelected = false,
    required this.text,
    required this.onTap,
  });

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        height: 31,
        decoration: BoxDecoration(
          color: isSelected ? ColorStyles.primary100 : ColorStyles.white,
          borderRadius:
              isSelected ? BorderRadius.circular(10) : BorderRadius.zero,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: isSelected ? ColorStyles.white : ColorStyles.primary100,
            ),
          ),
        ),
      ),
    );
  }
}
