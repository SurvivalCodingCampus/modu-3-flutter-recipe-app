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
import 'package:google_fonts/google_fonts.dart';

class MidiumButton extends StatefulWidget {
  const MidiumButton({super.key});

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
            color: isPressed
                ? const Color(0xFF129575).withOpacity(0.4)
                : const Color(0xFF129575),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            'Button      ⮕',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}