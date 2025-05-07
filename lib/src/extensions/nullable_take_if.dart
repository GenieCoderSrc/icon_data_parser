/// Utility extension for safe condition
extension NullableTakeIf<T> on T? {
  T? takeIf(bool Function(T value) predicate) {
    final self = this;
    return self != null && predicate(self) ? self : null;
  }
}
