/// This extension is using to check if a number is integer or not
extension NumExtensions on num {
  bool get isInt => (this % 1) == 0;
}
