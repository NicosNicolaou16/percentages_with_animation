import 'dart:math';

import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  final double currentState;
  final double strokeWidth;

  // The painter needs the ring width to find the ring's center line.
  final double backgroundStrokeWidth;

  final Color color;

  BorderPainter({
    required this.currentState,
    required this.strokeWidth,
    required this.backgroundStrokeWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // The ring is a Container Border, so this CustomPaint only gets
    // the area INSIDE the border. The old rect put the arc on the ring's
    // inner edge (half on the ring, half inside it). Inflating by half the
    // ring width moves the arc onto the ring's center line. CustomPaint
    // doesn't clip, so drawing slightly outside its box is fine.
    final rect = (Offset.zero & size).inflate(backgroundStrokeWidth / 2);

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Start at 12 o'clock and sweep clockwise by the current fraction.
    canvas.drawArc(rect, -pi / 2, currentState * 2 * pi, false, paint);
  }

  /// Only repaint when something visible changed
  @override
  bool shouldRepaint(covariant BorderPainter oldDelegate) {
    return oldDelegate.currentState != currentState ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.backgroundStrokeWidth != backgroundStrokeWidth ||
        oldDelegate.color != color;
  }
}
