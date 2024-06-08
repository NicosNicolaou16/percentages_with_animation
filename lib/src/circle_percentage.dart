import 'package:flutter/material.dart';
import 'package:percentages_with_animation/src/custom_painter/fill_painter.dart';

/// The circle percentage class provide you a to draw a circle percentage with different customization
class CirclePercentage extends StatefulWidget {
  /// This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage)
  final double currentPercentage;

  /// This parameter is required and it's the maximum percentage value, (currentPercentage <= maxPercentage)
  final double maxPercentage;

  /// This parameter is the circle size for the percentage with default size 100
  final double size;

  /// This parameter is the duration for the animation with default value 1000 ms
  final int? duration;

  /// This parameter is the stroke width for the background gradient circle
  final double backgroundStrokeWidth;

  /// This parameter is the bottom color for the percentage
  final Color percentageColor;

  /// This parameter is the circle color behind of the percentage
  final Color backgroundColor;

  /// This parameter is the text style of the label for the percentage text
  final TextStyle textStyle;

  const CirclePercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    this.size = 100,
    this.duration,
    required this.backgroundStrokeWidth,
    this.percentageColor = Colors.black,
    this.backgroundColor = Colors.black12,
    this.textStyle = const TextStyle(color: Colors.black),
  })  : assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0),
        assert(duration == null || duration >= 0);

  @override
  State<CirclePercentage> createState() => _CirclePercentageState();
}

class _CirclePercentageState extends State<CirclePercentage> {
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
            painter: FillPainter(
              currentState: value,
              color: widget.percentageColor,
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
