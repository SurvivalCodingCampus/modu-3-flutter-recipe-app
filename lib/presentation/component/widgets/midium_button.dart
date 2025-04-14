// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class MidiumButton extends StatelessWidget {
//   const MidiumButton({super.key});

//   void handleButtonClick() {
//     print('Midium 버튼 클릭됨!');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: 243,
//         height: 54,
//         child: ElevatedButton(
//           key: const Key('medium_button'),
//           onPressed: handleButtonClick,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFF129575),
//             foregroundColor: Colors.white,
//             textStyle: GoogleFonts.poppins(
//               fontSize: 16,
//               fontWeight: FontWeight.w600,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: const Text('Button      ⮕'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:recipe_app/ui/app_text_styles.dart';
import 'package:recipe_app/ui/color_style.dart';

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
              SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward,
                color: ColorStyle.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
