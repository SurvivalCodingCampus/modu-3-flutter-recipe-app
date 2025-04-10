import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigButton extends StatelessWidget {
  const BigButton({super.key});

  void _handleButtonClick() {
    print('Big 버튼 클릭됨!');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 315,
        height: 60,
        child: ElevatedButton(
          key: const Key('big_button'),
          onPressed: _handleButtonClick,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF129575),
            foregroundColor: Colors.white,
            textStyle: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('Button     ⮕'),
        ),
      ),
    );
  }
}