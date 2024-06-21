import 'package:flutter/material.dart';
import 'package:percentages_with_animation/src/custom_painter/gradient_circle_painter.dart';

/// The Gradient percentage class provide you a to draw a circle gradient percentage with different customization
class GradientCirclePercentage extends StatefulWidget {
  /// This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage)
  final double currentPercentage;

  /// This parameter is required and it's the maximum percentage value, (currentPercentage <= maxPercentage)
  final double maxPercentage;

  /// This parameter is the circle size for the percentage with default size 100
  final double size;

  /// This parameter is the duration for the animation with default value 1000 ms
  final int duration;

  /// This parameter is the stroke width for the percentage gradient circle
  final double percentageStrokeWidth;

  /// This parameter is the stroke width for the background gradient circle
  final double backgroundStrokeWidth;

  /// This parameter is the bottom color for the percentage
  final Color bottomColor;

  /// This parameter is the remaining color for the percentage circle
  final Color topColor;

  /// This parameter is the circle color behind of the percentage
  final Color backgroundColor;

  /// This parameter is a custom center text with default value null (if it null then show the percentage)
  final String? centerText;

  /// This parameter is the text style of the label for the percentage text
  final TextStyle textStyle;

  const GradientCirclePercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    this.size = 100,
    this.duration = 1000,
    required this.percentageStrokeWidth,
    required this.backgroundStrokeWidth,
    this.bottomColor = Colors.black,
    this.topColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.centerText,
    this.textStyle = const TextStyle(color: Colors.black),
  })  : assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0),
        assert(duration >= 0);

  @override
  State<GradientCirclePercentage> createState() =>
      _GradientCirclePercentageState();
}

class _GradientCirclePercentageState extends State<GradientCirclePercentage> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: widget.duration),
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
            painter: GradientCirclePainter(
              currentPercentage: value,
              topColor: widget.topColor,
              bottomColor: widget.bottomColor,
            ),
            child: Center(
              child: Text(
                widget.centerText ??
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
