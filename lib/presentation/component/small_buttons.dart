import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({super.key});

  void handleButtonClick() {
    print('Small 버튼 클릭됨!');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 174,
        height: 37,
        child: ElevatedButton(
          key: const Key('small_button'),
          onPressed: handleButtonClick,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF129575),
            foregroundColor: Colors.white,
            textStyle: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Button'),
        ),
      ),
    );
  }
}