extension DoubleExtension on double? {
  double orEmpty() {
    final double? result;
    if (this == null) {
      result = 0.00;
    } else {
      result = this!;
    }

    return result;
  }
}
