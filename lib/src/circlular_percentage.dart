import 'package:flutter/material.dart';

import 'package:percentages_with_animation/src/custom_widgets/border_painter.dart';

class CircularPercentage extends StatefulWidget {
  final double currentPercentage;
  final double maxPercentage;
  final double size;
  final double strokeWidth;
  final double backgroundStrokeWidth;
  final Color color;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int? duration;

  const CircularPercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    this.size = 100,
    required this.strokeWidth,
    required this.backgroundStrokeWidth,
    this.color = Colors.black,
    this.backgroundColor = Colors.black12,
    this.textStyle = const TextStyle(color: Colors.black),
    this.duration,
  }) : assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0),
        assert(duration == null || duration >= 0);

  @override
  State<CircularPercentage> createState() => _CircularPercentageState();
}

class _CircularPercentageState extends State<CircularPercentage> {
  final int _delay = 1000;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: widget.duration ?? _delay),
      curve: Curves.easeIn,
      tween: Tween<double>(
        begin: 0,
        end: widget.currentPercentage / widget.maxPercentage,
      ),
      builder: (context, value, _) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              width: widget.backgroundStrokeWidth,
              color: widget.backgroundColor,
            ),
          ),
          child: CustomPaint(
            painter: BorderPainter(
              currentState: value,
              strokeWidth: widget.strokeWidth,
              color: widget.color,
            ),
            child: Center(
              child: Text(
                (value * widget.maxPercentage).toInt().toString(),
                style: widget.textStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
