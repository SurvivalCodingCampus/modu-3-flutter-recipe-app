import 'package:flutter/material.dart';

class NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final path = Path();

    final width = size.width;
    final height = size.height;

    // 왼쪽에서 홈 전까지
    path.moveTo(0, 0);
    path.lineTo(width * 0.3, 0);

    // 홈 왼쪽 곡선
    path.quadraticBezierTo(width * 0.375, 0, width * 0.40, 15);
    path.quadraticBezierTo(width * 0.50, 60, width * 0.60, 15);
    path.quadraticBezierTo(width * 0.625, 0, width * 0.7, 0);

    // 오른쪽으로 마무리
    path.lineTo(width, 0);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.1), 6, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
