import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  final Color color;
  MyCustomPainter({this.color});
  @override
  void paint(Canvas canvas, Size size) {
     Paint paint = new Paint()
      ..color = this.color
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;
      
      canvas.drawPath(
        Path()
        ..moveTo(0, 0)
        ..lineTo(0,size.height)
        ..lineTo(size.width, size.height * 0.8)
        ..lineTo(size.width, 0)
        ..close()
      , paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw UnimplementedError();
  }
}
