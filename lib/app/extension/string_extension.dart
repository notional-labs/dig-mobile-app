extension StringExtension on String {
  String trimMiddleWithDot(int length) {
    try {
      const numberOfDots = 3;
      var dotsString = List<String>.filled(numberOfDots, '.').join();

      var leftSizeLength = ((length - numberOfDots) / 2).floor();
      var rightSizeLength = this.length - leftSizeLength;
      var leftPart = substring(0, leftSizeLength);
      var rightPart = substring(rightSizeLength);
      return '$leftPart$dotsString$rightPart';
    } catch (_) {
      return this;
    }
  }

  DateTime? toDateTime() {
    return DateTime.tryParse(this);
  }
}
