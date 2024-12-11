extension StringExtension on String? {
  String orEmpty() {
    final String? result;
    if (this == null) {
      result = " ";
    } else {
      result = this!;
    }

    return result;
  }
}
