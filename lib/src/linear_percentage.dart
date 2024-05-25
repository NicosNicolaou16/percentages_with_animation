import 'package:flutter/material.dart';

class LinearPercentage extends StatefulWidget {
  final double currentPercentage;
  final double maxPercentage;
  final double height;
  final double heightPercentage;
  final int? duration;
  final Decoration? backgroundDecoration;
  final Decoration? percentageDecoration;
  final Color backgroundPercentageColor;
  final Color percentageColor;

  const LinearPercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    required this.height,
    required this.heightPercentage,
    this.duration,
    this.backgroundDecoration,
    this.percentageDecoration,
    this.backgroundPercentageColor = Colors.black26,
    this.percentageColor = Colors.black,
  })  : assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0),
        assert(duration == null || duration >= 0);

  @override
  State<LinearPercentage> createState() => _LinearPercentageState();
}

class _LinearPercentageState extends State<LinearPercentage> {
  final int _delay = 1000;

  double get _maxWidget => MediaQuery.of(context).size.width;

  double get _percentage =>
      (widget.currentPercentage / widget.maxPercentage) * _maxWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: _maxWidget,
          height: widget.height,
          color: widget.backgroundDecoration == null
              ? widget.backgroundPercentageColor
              : null,
          decoration: widget.backgroundDecoration,
        ),
        TweenAnimationBuilder(
          duration: Duration(milliseconds: widget.duration ?? _delay),
          curve: Curves.easeInOut,
          tween: Tween<double>(
            begin: 0,
            end: _percentage,
          ),
          builder: (context, value, _) => Container(
            width: value,
            height: widget.heightPercentage,
            color: widget.percentageDecoration == null
                ? widget.percentageColor
                : null,
            decoration: widget.percentageDecoration,
          ),
        ),
      ],
    );
  }
}
