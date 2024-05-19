import 'package:flutter/material.dart';

class LinearPercentage extends StatelessWidget {
  final double currentPercentage;
  final double maxPercentage;
  final double height;
  final double heightPercentage;
  int? duration;
  Decoration? decoration;
  Decoration? percentageDecoration;

  LinearPercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    required this.height,
    required this.heightPercentage,
    this.duration,
    this.decoration,
    this.percentageDecoration,
  }) : assert(currentPercentage <= maxPercentage);

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double percent = (40 / 100) * x;
    return Center(
      child: Stack(
        children: [
          Container(
            width: x,
            height: height,
            color: Colors.black26,
            decoration: decoration,
          ),
          TweenAnimationBuilder(
            duration: Duration(milliseconds: duration ?? 1000),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: percent,
            ),
            builder: (context, value, _) => Container(
              width: value,
              height: heightPercentage,
              color: Colors.black,
              decoration: percentageDecoration,
            ),
          ),
        ],
      ),
    );
  }
}
