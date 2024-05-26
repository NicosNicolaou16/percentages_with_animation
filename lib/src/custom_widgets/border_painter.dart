import 'dart:math';

import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  final double currentState;

  BorderPainter({required this.currentState});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 5;
    Rect rect = const Offset(0, 0) & Size(size.width, size.height);

    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double startAngle = -pi / 2;
    double sweepAmount = currentState * 2 * pi;

    canvas.drawArc(rect, startAngle, sweepAmount, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}