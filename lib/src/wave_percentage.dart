import 'dart:math';

import 'package:flutter/material.dart';
import 'package:percentages_with_animation/src/extensions/extensions.dart';

import 'custom_painter/wave_painter.dart';

/// The Wave percentage class provide you a to draw a wave percentage with different customizations
class WavePercentage extends StatefulWidget {
  /// This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage & currentPercentage >= 0.0)
  final double currentPercentage;

  /// This parameter is required and it's the maximum percentage value, (maxPercentage >= currentPercentage)
  final double maxPercentage;

  /// This parameter is the wave frequency for the percentage with default value 2
  final double waveFrequency;

  /// This parameter is the circle size for the percentage with default size 100
  final double size;

  /// This parameter is the duration for the animation with default value 1000 ms
  final int duration;

  /// This parameter is the wave color with default value green
  final Color waveColor;

  /// This parameter is the color animation begin with default value null (if it null then use the waveColor)
  final Color? colorAnimationBegin;

  /// This parameter is the color animation end with default value null (if it null then use the waveColor)
  final Color? colorAnimationEnd;

  /// This parameter is the amplitude begin with default value 10, (amplitudeBegin >= 0)
  final double amplitudeBegin;

  /// This parameter is the amplitude end with default value 10 (amplitudeEnd >= 0)
  final double amplitudeEnd;

  /// This parameter is the stroke width for the background gradient circle
  final double backgroundStrokeWidth;

  /// This parameter is the circle color behind of the percentage
  final Color backgroundColor;

  /// This parameter is a custom center text with default value null (if it null then show the percentage value)
  final String? centerText;

  /// This parameter is the text style of the label for the percentage text
  final TextStyle centerTextStyle;

  /// This parameter is the call back to get the current percentage value during the animation (optional)
  final Function(double)? onCurrentValue;

  const WavePercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    this.waveFrequency = 2,
    this.size = 100,
    this.duration = 1000,
    this.waveColor = Colors.green,
    this.colorAnimationBegin,
    this.colorAnimationEnd,
    this.amplitudeBegin = 10,
    this.amplitudeEnd = 10,
    required this.backgroundStrokeWidth,
    this.backgroundColor = Colors.white,
    this.centerText,
    this.centerTextStyle = const TextStyle(color: Colors.black),
    this.onCurrentValue,
  })  : assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0),
        assert(duration >= 0),
        assert(waveFrequency > 0),
        assert(amplitudeBegin > 0),
        assert(amplitudeEnd > 0);

  @override
  State<WavePercentage> createState() => _WavePercentageState();
}

class _WavePercentageState extends State<WavePercentage>
    with TickerProviderStateMixin {
  /// Animation Controller for the wave color
  late AnimationController _colorController;

  /// Animation for the wave color
  late Animation<Color?> _colorAnimation;

  /// Animation Controller for the wave amplitude
  late AnimationController _controller;

  /// Animation for the wave amplitude
  late AnimationController _amplitudeController;

  /// Animation for the wave amplitude
  late Animation<double> _amplitudeAnimation;

  /// Tween for the wave amplitude
  late Tween<double> _amplitudeTween;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    if (widget.colorAnimationBegin == null &&
        widget.colorAnimationEnd == null) {
      _colorController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
      )..repeat();
      _colorAnimation = ColorTween(
              begin: widget.colorAnimationBegin, end: widget.colorAnimationEnd)
          .animate(_colorController);
    }
    _amplitudeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _amplitudeTween = Tween<double>(
      begin: widget.amplitudeBegin,
      end: widget.amplitudeEnd,
    );
    _amplitudeAnimation = _amplitudeTween
        .animate(_amplitudeController); // Amplitude between 10 and 10
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _amplitudeController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  _handleAmplitudeAnimationWhenMaxPercentage(double valueToShowOnText) {
    if (valueToShowOnText == widget.maxPercentage) {
      _amplitudeTween = Tween<double>(
        begin: 0,
        end: 0,
      );
      _amplitudeAnimation = _amplitudeTween.animate(_amplitudeController);
    } else {
      if (_amplitudeTween.begin == 0 && _amplitudeTween.end == 0) {
        _amplitudeTween = Tween<double>(
          begin: widget.amplitudeBegin,
          end: widget.amplitudeEnd,
        );
        _amplitudeAnimation = _amplitudeTween.animate(_amplitudeController);
      }
    }
  }

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
        double valueToShowOnText = value * widget.maxPercentage;
        _handleAmplitudeAnimationWhenMaxPercentage(valueToShowOnText);
        if (widget.onCurrentValue != null) {
          widget.onCurrentValue!(
              double.parse(valueToShowOnText.toStringAsFixed(2)));
        }
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
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: WavePainter(
                    fillPercentage: value,
                    waveFrequency: widget.waveFrequency,
                    waveAmplitude: _amplitudeAnimation.value,
                    wavePhase: _controller.value * 2 * pi,
                    waveColor: _colorAnimation.value ?? widget.waveColor,
                  ),
                  child: Center(
                    child: Text(
                      widget.centerText ??
                          (widget.currentPercentage.isInt == true
                              ? valueToShowOnText.toInt().toString()
                              : valueToShowOnText.toStringAsFixed(2)),
                      style: widget.centerTextStyle,
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
