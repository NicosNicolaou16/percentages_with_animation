import 'package:flutter/material.dart';

class LinearPercentage extends StatefulWidget {
  final double currentPercentage;
  final double maxPercentage;
  final double height;
  final double heightPercentage;
  final int? duration;
  final Decoration? decoration;
  final Decoration? percentageDecoration;
  final Color backgroundPercentage;
  final Color percentage;

  LinearPercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    required this.height,
    required this.heightPercentage,
    this.duration,
    this.decoration,
    this.percentageDecoration,
    this.backgroundPercentage = Colors.black26,
    this.percentage = Colors.black,
  })  : assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0);

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
          color: widget.backgroundPercentage,
          decoration: widget.decoration,
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
            color: widget.percentage,
            decoration: widget.percentageDecoration,
          ),
        ),
      ],
    );
  }
}
