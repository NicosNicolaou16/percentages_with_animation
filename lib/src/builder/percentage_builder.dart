import 'package:flutter/material.dart';

typedef MyLayoutBuilder = Widget Function(
  BuildContext context,
  double percent,
  double maxWidth,
);

class PercentageBuilder extends StatelessWidget {
  final double currentPercentage;
  final double maxPercentage;
  final MyLayoutBuilder myLayoutBuilder;

  const PercentageBuilder({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    required this.myLayoutBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstrain) {
      double maxWidth = boxConstrain.maxWidth;
      double percentage = (currentPercentage / maxPercentage) * maxWidth;
      return myLayoutBuilder(context, percentage, maxWidth);
    });
  }
}
