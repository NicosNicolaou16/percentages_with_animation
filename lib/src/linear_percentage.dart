import 'package:flutter/material.dart';

class LinearPercentage extends StatelessWidget {
  final int percentage;

  const LinearPercentage({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    double percent = (40 / 100) * x;
    return Center(
      child: Stack(
        children: [
          Container(
            width: x,
            height: 10,
            color: Colors.black26,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 5000),
            width: percent,
            height: 10,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
