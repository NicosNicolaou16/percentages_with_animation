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
      ..strokeWidth = 2.0;

    final wavePath = Path();
    final fillHeight = size.height * (1 - fillPercentage);
    final centerX = size.width / 2;

    /// Starting point with phase
    wavePath.moveTo(
        0,
        fillHeight +
            waveAmplitude *
                sin(waveFrequency * (-centerX) / size.width * 2 * pi +
                    pi / 2 +
                    wavePhase));
    double previousY = fillHeight +
        waveAmplitude *
            sin(waveFrequency * (-centerX) / size.width * 2 * pi +
                pi / 2 +
                wavePhase);

    for (double x = 0; x <= size.width; x++) {
      /// Incorporate phase into the wave calculation
      final y = fillHeight +
          waveAmplitude *
              sin(waveFrequency * (x - centerX) / size.width * 2 * pi +
                  pi / 2 +
                  wavePhase);

      if (x == 0) {
        wavePath.moveTo(x, y);
      } else {
        wavePath.quadraticBezierTo(
          x - 0.5,
          (y + previousY) / 2,
          x,
          y,
        );
      }
      previousY = y;
    }

    /// Ending point with phase
    wavePath.lineTo(
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

    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();

    final circlePath = Path();
    circlePath.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    ));

    canvas.clipPath(circlePath);
    canvas.drawPath(wavePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
