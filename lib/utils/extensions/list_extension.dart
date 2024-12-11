extension ListExtension<T> on List<T>? {
  List<T> orEmpty() {
    return this ?? List.empty();
  }
}
