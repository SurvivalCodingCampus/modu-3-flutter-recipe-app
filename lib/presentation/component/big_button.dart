// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class BigButton extends StatelessWidget {
//   const BigButton({super.key});

//   void _handleButtonClick() {
//     print('Big 버튼 클릭됨!');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: 315,
//         height: 60,
//         child: ElevatedButton(
//           key: const Key('big_button'),
//           onPressed: _handleButtonClick,
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
//           child: const Text('Button     ⮕'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigButton extends StatefulWidget {
  const BigButton({super.key});

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isPressed = false;

  void _handleButtonClick() {
    print('Big 버튼 클릭됨!');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            isPressed = true; // TapDown 시 disable 상태처럼
          });
        },
        onTapUp: (_) {
          setState(() {
            isPressed = false; // TapUp 시 기본 상태
          });
          _handleButtonClick(); // 실제 클릭 처리
        },
        onTapCancel: () {
          setState(() {
            isPressed = false; // Tap 중 취소 시 기본 상태
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: 315,
          height: 60,
          decoration: BoxDecoration(
            color: isPressed
                ? const Color(0xFF129575).withOpacity(0.4) // 눌렀을 때 흐려짐
                : const Color(0xFF129575),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            'Button     ⮕',
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