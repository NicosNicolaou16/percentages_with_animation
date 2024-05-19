import 'package:flutter/material.dart';

class LinearPercentage extends StatefulWidget {
  final double currentPercentage;
  final double maxPercentage;
  final double height;
  final double heightPercentage;

  const LinearPercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    required this.height,
    required this.heightPercentage,
  }) : assert(currentPercentage <= maxPercentage);

  @override
  State<LinearPercentage> createState() => _LinearPercentageState();
}

class _LinearPercentageState extends State<LinearPercentage> {
  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double percent = (40 / 100) * x;
    return Center(
      child: Stack(
        children: [
          Container(
            width: x,
            height: widget.height,
            color: Colors.black26,
          ),
          TweenAnimationBuilder(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            tween: Tween<double>(
              begin: 0,
              end: percent,
            ),
            builder: (context, value, _) => Container(
              width: value,
              height: widget.heightPercentage,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
