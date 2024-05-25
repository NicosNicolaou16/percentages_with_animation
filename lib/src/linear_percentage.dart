import 'package:flutter/material.dart';
import 'package:percentages_with_animation/percentages_with_animation.dart';
import 'package:percentages_with_animation/src/builder/percentage_builder.dart';

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
  final LeftRightText leftRightText;
  final TextStyle? leftTextStyle;
  final TextStyle? rightTextStyle;
  final double leftTextRightPadding;
  final double rightTextRightPadding;

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
    this.leftRightText = LeftRightText.none,
    this.leftTextStyle,
    this.rightTextStyle,
    this.leftTextRightPadding = 5,
    this.rightTextRightPadding = 5,
  })  : assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0),
        assert(duration == null || duration >= 0);

  @override
  State<LinearPercentage> createState() => _LinearPercentageState();
}

class _LinearPercentageState extends State<LinearPercentage> {
  final int _delay = 1000;

  @override
  Widget build(BuildContext context) {
    return PercentageBuilder(
        currentPercentage: widget.currentPercentage,
        maxPercentage: widget.maxPercentage,
        myLayoutBuilder: (context, percentage, maxWidth) {
          return Row(
            children: [
              if (widget.leftRightText == LeftRightText.leftOnly ||
                  widget.leftRightText == LeftRightText.both) ...[
                TweenAnimationBuilder(
                  duration: Duration(milliseconds: widget.duration ?? _delay),
                  curve: Curves.easeInOut,
                  tween: Tween<double>(
                    begin: 0,
                    end: widget.currentPercentage,
                  ),
                  builder: (context, value, _) => Text(
                    value.toInt().toString(),
                    style: widget.leftTextStyle,
                  ),
                ),
                SizedBox(
                  width: widget.leftTextRightPadding,
                ),
              ],
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: maxWidth,
                      height: widget.height,
                      color: widget.backgroundDecoration == null
                          ? widget.backgroundPercentageColor
                          : null,
                      decoration: widget.backgroundDecoration,
                    ),
                    TweenAnimationBuilder(
                      duration:
                          Duration(milliseconds: widget.duration ?? _delay),
                      curve: Curves.easeInOut,
                      tween: Tween<double>(
                        begin: 0,
                        end: percentage,
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
                ),
              ),
              if (widget.leftRightText == LeftRightText.rightOnly ||
                  widget.leftRightText == LeftRightText.both) ...[
                SizedBox(
                  width: widget.rightTextRightPadding,
                ),
                Text(
                  widget.maxPercentage.toInt().toString(),
                  style: widget.rightTextStyle,
                ),
              ],
            ],
          );
        });
  }
}
