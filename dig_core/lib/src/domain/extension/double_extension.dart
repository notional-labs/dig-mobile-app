extension DoubleExtension on double {
  double toPrecision(int n) => double.tryParse(toStringAsFixed(n)) ?? 0;
}
