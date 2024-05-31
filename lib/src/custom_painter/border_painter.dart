import 'dart:math';

import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  final double currentState;
  final double strokeWidth;
  final Color color;

  BorderPainter({
    required this.currentState,
    required this.strokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = const Offset(0, 0) & Size(size.width, size.height);

    var paint = Paint()
      ..color = color
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
