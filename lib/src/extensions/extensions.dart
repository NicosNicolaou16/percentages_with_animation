/// This extension is using to check if a number is integer or not
extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;

  String get formatted => isInt ? toInt().toString() : toStringAsFixed(2);

  String formatAgainst(num target) =>
      target.isInt ? toInt().toString() : toStringAsFixed(2);
}
