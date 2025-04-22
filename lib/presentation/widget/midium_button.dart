import 'package:flutter/material.dart';
import 'package:recipe_app/app/ui/app_text_styles.dart';
import 'package:recipe_app/app/ui/color_style.dart';

class MidiumButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  const MidiumButton({required this.text, required this.onPressed, super.key});

  @override
  State<MidiumButton> createState() => _MidiumButtonState();
}

class _MidiumButtonState extends State<MidiumButton> {
  bool isPressed = false;

  void handleButtonClick() {
    print('Midium 버튼 클릭됨!');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: (_) {
          setState(() {
            isPressed = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            isPressed = false;
          });
          handleButtonClick();
        },
        onTapCancel: () {
          setState(() {
            isPressed = false;
          });
        },
        child: Material(
          // ✅ 여기가 핵심
          color: Colors.transparent, // 배경은 투명하게 유지
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 243,
            height: 54,
            decoration: BoxDecoration(
              color:
                  isPressed
                      ? const Color(0xFF129575).withOpacity(0.4)
                      : const Color(0xFF129575),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.text,
                  style: AppTextStyles.normalBold(color: ColorStyle.white),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  color: ColorStyle.white,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
