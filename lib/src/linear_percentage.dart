import 'package:flutter/material.dart';
import 'package:percentages_with_animation/percentages_with_animation.dart';
import 'package:percentages_with_animation/src/builder/percentage_builder.dart';
import 'package:percentages_with_animation/src/extensions/extensions.dart';

/// The Linear percentage class provide you a to draw a linear percentage with different customizations
class LinearPercentage extends StatefulWidget {
  /// This parameter is required and it's the current percentage value, (currentPercentage <= maxPercentage & currentPercentage >= 0.0)
  final double currentPercentage;

  /// This parameter is required and it's the maximum percentage value, (maxPercentage >= currentPercentage)
  final double maxPercentage;

  /// This parameter is required and it's the background height behind of the percentage view
  final double backgroundHeight;

  /// This parameter is required and it's the percentage height
  final double percentageHeight;

  /// This parameter is the duration for the animation with default value 1000 ms
  final int duration;

  /// This parameter is the background decoration behind of the percentage view
  final Decoration? backgroundDecoration;

  /// This parameter is the percentage decoration
  final Decoration? percentageDecoration;

  /// This parameter is the background color behind of the percentage view with default value black26
  final Color backgroundColor;

  /// This parameter is the percentage color with default value black
  final Color percentageColor;

  /// This parameter is the enum value for the left and right text (min and max value - label) - accepted value `leftOnly`, `rightOnly`, `both`, `none`, default value: `none`
  final LeftRightText leftRightText;

  /// This parameter is the text style for the left text
  final TextStyle? leftTextStyle;

  /// This parameter is the text style for the right text
  final TextStyle? rightTextStyle;

  /// This parameter is the spacing between the left text and the bar, default value: 5
  final double leftTextRightPadding;

  /// This parameter is the spacing between the bar and the right text, default value: 5
  final double rightTextRightPadding;

  /// This parameter is the option to show the percentage value on percentage view with default value: false
  final bool showPercentageOnPercentageView;

  /// This parameter is the text style for percentage on percentage view
  final TextStyle? percentageOnPercentageViewTextStyle;

  /// Whether to show a `%` symbol after the percentage value, default value: false
  final bool showPercentageSymbol;

  /// This parameter is the call back to get the current percentage value during the animation (optional)
  final ValueChanged<double>? onCurrentValue;

  const LinearPercentage({
    super.key,
    required this.currentPercentage,
    required this.maxPercentage,
    required this.backgroundHeight,
    required this.percentageHeight,
    this.duration = 1000,
    this.backgroundDecoration,
    this.percentageDecoration,
    this.backgroundColor = Colors.black26,
    this.percentageColor = Colors.black,
    this.leftRightText = LeftRightText.none,
    this.leftTextStyle,
    this.rightTextStyle,
    this.leftTextRightPadding = 5,
    this.rightTextRightPadding = 5,
    this.showPercentageOnPercentageView = false,
    this.percentageOnPercentageViewTextStyle,
    this.showPercentageSymbol = true,
    this.onCurrentValue,
  })  : assert(maxPercentage > 0),
        assert(currentPercentage <= maxPercentage),
        assert(currentPercentage >= 0),
        assert(duration >= 0);

  @override
  State<LinearPercentage> createState() => _LinearPercentageState();
}

class _LinearPercentageState extends State<LinearPercentage> {
  /// Last value sent to onCurrentValue, used to skip duplicates
  double? _lastReported;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.leftRightText == LeftRightText.leftOnly ||
            widget.leftRightText == LeftRightText.both) ...[
          _leftText(),
        ],
        Expanded(
          child: PercentageBuilder(
            currentPercentage: widget.currentPercentage,
            maxPercentage: widget.maxPercentage,
            myLayoutBuilder: (context, percentage, maxWidth) {
              return Stack(
                children: [
                  Container(
                    width: maxWidth,
                    height: widget.backgroundHeight,
                    color: widget.backgroundDecoration == null
                        ? widget.backgroundColor
                        : null,
                    decoration: widget.backgroundDecoration,
                  ),
                  TweenAnimationBuilder(
                    duration: Duration(milliseconds: widget.duration),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(
                      begin: 0,
                      end: percentage,
                    ),
                    builder: (context, value, _) {
                      final current = maxWidth == 0
                          ? 0.0
                          : (value / maxWidth * widget.maxPercentage * 100)
                                  .roundToDouble() /
                              100;
                      if (current != _lastReported) {
                        _lastReported = current;

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            widget.onCurrentValue?.call(current);
                          }
                        });
                      }
                      return Container(
                        key: const ValueKey('percentage-bar'),
                        width: value,
                        height: widget.percentageHeight,
                        color: widget.percentageDecoration == null
                            ? widget.percentageColor
                            : null,
                        decoration: widget.percentageDecoration,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: widget.showPercentageOnPercentageView == true
                              ? _labelOnPercentage()
                              : null,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
        if (widget.leftRightText == LeftRightText.rightOnly ||
            widget.leftRightText == LeftRightText.both) ...[
          _rightText(),
        ],
      ],
    );
  }

  Widget _leftText() {
    return Padding(
      padding: EdgeInsets.only(right: widget.leftTextRightPadding),
      child: TweenAnimationBuilder(
        duration: Duration(milliseconds: widget.duration),
        curve: Curves.easeInOut,
        tween: Tween<double>(
          begin: 0,
          end: widget.currentPercentage,
        ),
        builder: (context, value, _) {
          return Text(
            value
                .formatAgainst(widget.currentPercentage)
                .withPercentageSymbol(widget.showPercentageSymbol),
            style: widget.leftTextStyle,
          );
        },
      ),
    );
  }

  Widget _rightText() {
    return Padding(
      padding: EdgeInsets.only(left: widget.rightTextRightPadding),
      child: Text(
        widget.maxPercentage.formatted
            .withPercentageSymbol(widget.showPercentageSymbol),
        style: widget.rightTextStyle,
      ),
    );
  }

  Widget _labelOnPercentage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "${widget.currentPercentage.formatted.withPercentageSymbol(widget.showPercentageSymbol)}"
        "/${widget.maxPercentage.formatted.withPercentageSymbol(widget.showPercentageSymbol)}",
        style: widget.percentageOnPercentageViewTextStyle,
      ),
    );
  }
}
