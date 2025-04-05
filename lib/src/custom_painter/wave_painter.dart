import 'dart:math';

import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final double fillPercentage;
  final double waveFrequency;
  final double waveAmplitude;
  final double wavePhase;
  final Color waveColor;

  WavePainter({
    required this.fillPercentage,
    required this.waveFrequency,
    required this.waveAmplitude,
    required this.wavePhase,
    required this.waveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    final path = Path();
    final fillHeight = size.height * (1 - fillPercentage);
    final centerX = size.width / 2;
    double previousY;

    // Use a single moveTo for the initial point
    previousY = fillHeight +
        waveAmplitude *
            sin(waveFrequency * (-centerX) / size.width * 2 * pi +
                pi / 2 +
                wavePhase);
    path.moveTo(0, previousY);

    for (double x = 0; x <= size.width; x++) {
      final y = fillHeight +
          waveAmplitude *
              sin(waveFrequency * (x - centerX) / size.width * 2 * pi +
                  pi / 2 +
                  wavePhase);

      path.quadraticBezierTo(
        x - 0.5,
        (y + previousY) / 2,
        x,
        y,
      );
      previousY = y;
    }

    // Use a single lineTo for the final point
    path.lineTo(
        size.width,
        fillHeight +
            waveAmplitude *
                sin(waveFrequency *
                        (size.width - centerX) /
                        size.width *
                        2 *
                        pi +
                    pi / 2 +
                    wavePhase));

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    final circlePath = Path();
    circlePath.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    ));

    canvas.clipPath(circlePath);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is WavePainter) {
      final old = oldDelegate;
      return fillPercentage != old.fillPercentage ||
          waveFrequency != old.waveFrequency ||
          waveAmplitude != old.waveAmplitude ||
          wavePhase != old.wavePhase ||
          waveColor != old.waveColor;
    }
    return true;
  }
}
