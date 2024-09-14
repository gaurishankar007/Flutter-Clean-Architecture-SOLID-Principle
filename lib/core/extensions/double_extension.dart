extension DoubleExtension on double {
  double positiveValue() => this < 0 ? 0 : this;
}
