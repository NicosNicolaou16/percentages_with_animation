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
  })  : assert(maxPercentage > 0),
        assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0),
        assert(duration >= 0),
        assert(waveFrequency > 0),
        assert(amplitudeBegin >= 0),
        assert(amplitudeEnd >= 0);

  @override
  State<WavePercentage> createState() => _WavePercentageState();
}

class _WavePercentageState extends State<WavePercentage>
    with TickerProviderStateMixin {
  /// Last value sent to onCurrentValue, used to skip duplicates
  double? _lastReported;

  /// Whether the wave is currently flattened because the fill reached 100%
  bool _isFlattened = false;

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

  /// Calculate the two pi value
  static const double _twoPi = 2 * pi;

  @override
  void initState() {
    /// Wave color animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    /// Wave color animation
    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    // Fall back to waveColor for any color that isn't set, so the tween
    // never produces null.
    _colorAnimation = ColorTween(
      begin: widget.colorAnimationBegin ?? widget.waveColor,
      end: widget.colorAnimationEnd ?? widget.waveColor,
    ).animate(_colorController);
    // Only run the color animation when the user actually asked for it.
    // Otherwise the controller stays idle (no wasted ticks).
    if (widget.colorAnimationBegin != null ||
        widget.colorAnimationEnd != null) {
      _colorController.repeat(reverse: true);
    }

    /// Amplitude animation
    _amplitudeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _amplitudeTween = Tween<double>(
      begin: widget.amplitudeBegin,
      end: widget.amplitudeEnd,
    );
    _amplitudeAnimation = _amplitudeTween.animate(_amplitudeController);
    super.initState();
  }

  @override
  void dispose() {
    /// Dispose the animation controllers
    _controller.dispose();
    _amplitudeController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  /// Flattens the wave when the fill reaches 100% and restores the user's
  /// amplitudes below that. Uses `>= 1.0` because an exact double comparison
  /// can miss due to rounding, and only rebuilds the tween when the state
  /// flips.
  void _handleAmplitudeAnimationWhenMaxPercentage(double value) {
    if (value >= 1.0 && !_isFlattened) {
      _isFlattened = true;
      _amplitudeTween = Tween<double>(begin: 0, end: 0);
      _amplitudeAnimation = _amplitudeTween.animate(_amplitudeController);
    } else if (value < 1.0 && _isFlattened) {
      _isFlattened = false;
      _amplitudeTween = Tween<double>(
        begin: widget.amplitudeBegin,
        end: widget.amplitudeEnd,
      );
      _amplitudeAnimation = _amplitudeTween.animate(_amplitudeController);
    }
  }

  /// Applies amplitude and color changes made after the first build
  @override
  void didUpdateWidget(covariant WavePercentage oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Apply new amplitudes, unless the wave is currently flattened at 100%
    // (un-flattening restores the user's amplitudes anyway).
    if (!_isFlattened &&
        (oldWidget.amplitudeBegin != widget.amplitudeBegin ||
            oldWidget.amplitudeEnd != widget.amplitudeEnd)) {
      _amplitudeTween = Tween<double>(
        begin: widget.amplitudeBegin,
        end: widget.amplitudeEnd,
      );
      _amplitudeAnimation = _amplitudeTween.animate(_amplitudeController);
    }

    // Rebuild the color animation if any color input changed.
    if (oldWidget.colorAnimationBegin != widget.colorAnimationBegin ||
        oldWidget.colorAnimationEnd != widget.colorAnimationEnd ||
        oldWidget.waveColor != widget.waveColor) {
      _colorAnimation = ColorTween(
        begin: widget.colorAnimationBegin ?? widget.waveColor,
        end: widget.colorAnimationEnd ?? widget.waveColor,
      ).animate(_colorController);

      // Start or stop the color controller to match the new settings.
      if (widget.colorAnimationBegin != null ||
          widget.colorAnimationEnd != null) {
        _colorController.repeat(reverse: true);
      } else {
        _colorController.stop();
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
        _handleAmplitudeAnimationWhenMaxPercentage(value);
        final current = (valueToShowOnText * 100).roundToDouble() / 100;

        if (current != _lastReported) {
          _lastReported = current;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              widget.onCurrentValue?.call(current);
            }
          });
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
                    wavePhase: _controller.value * _twoPi,
                    waveColor: _colorAnimation.value ?? widget.waveColor,
                  ),
                  child: Center(
                    child: Text(
                      widget.centerText ??
                          valueToShowOnText
                              .formatAgainst(widget.currentPercentage),
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
