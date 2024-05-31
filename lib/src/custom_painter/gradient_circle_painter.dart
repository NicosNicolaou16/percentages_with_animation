import 'package:flutter/material.dart';

class GradientCirclePainter extends CustomPainter {
  double currentPercentage;
  final Color bottomColor;
  final Color topColor;

  GradientCirclePainter({
    required this.currentPercentage,
    required this.bottomColor,
    required this.topColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          bottomColor,
          topColor,
        ],
        stops: [
          0.0,
          currentPercentage,
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
