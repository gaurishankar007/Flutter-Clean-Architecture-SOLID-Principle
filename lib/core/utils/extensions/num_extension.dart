extension NumExtension<T extends num> on T {
  T get avoidNegativeValue => (this < 0 ? 0 : this) as T;
}
