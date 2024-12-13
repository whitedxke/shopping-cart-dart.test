extension IntExtension on int? {
  int orEmpty() {
    final int? result;
    if (this == null) {
      result = 0;
    } else {
      result = this!;
    }

    return result;
  }
}
