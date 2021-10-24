import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RedLinePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final redLine = Paint()
      ..strokeWidth = 1.5
      ..color = Colors.red;
    final size1 = Offset(0, size.height);
    final size2 = Offset(size.width, 0);
    canvas.drawLine(size1, size2, redLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
