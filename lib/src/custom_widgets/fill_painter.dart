import 'dart:math';

import 'package:flutter/material.dart';

class FillPainter extends CustomPainter {
  final double currentState;
  final Color color;

  FillPainter({
    required this.currentState,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Offset(0, 0) & Size(size.width, size.height);

    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double startAngle = -pi * 100;
    double sweepAmount = currentState * 2 * pi;

    canvas.drawArc(rect, startAngle, sweepAmount, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
