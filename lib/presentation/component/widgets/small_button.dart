// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SmallButton extends StatelessWidget {
//   const SmallButton({super.key});

//   void handleButtonClick() {
//     print('Small 버튼 클릭됨!');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: 174,
//         height: 37,
//         child: ElevatedButton(
//           key: const Key('small_button'),
//           onPressed: handleButtonClick,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: const Color(0xFF129575),
//             foregroundColor: Colors.white,
//             textStyle: GoogleFonts.poppins(
//               fontSize: 11,
//               fontWeight: FontWeight.w600,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           child: const Text('Button'),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatefulWidget {
  const SmallButton({super.key});

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isPressed = false;

  void handleButtonClick() {
    print('Small 버튼 클릭됨!');
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
          width: 174,
          height: 37,
          decoration: BoxDecoration(
            color: isPressed
                ? const Color(0xFF129575).withOpacity(0.4)
                : const Color(0xFF129575),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            'Button',
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}