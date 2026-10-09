/// Number helpers used by all percentage widgets
extension NumExtensions on num {
  /// Whether the number has no fractional part
  bool get isInt => (this % 1) == 0;

  /// Integer text for whole numbers, two decimals otherwise
  String get formatted => isInt ? toInt().toString() : toStringAsFixed(2);

  /// Formats this value using the precision of [target]
  /// (integers if the target is whole, two decimals otherwise)
  String formatAgainst(num target) =>
      target.isInt ? toInt().toString() : toStringAsFixed(2);
}
