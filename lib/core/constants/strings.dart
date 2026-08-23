class AppStrings {
  const AppStrings._();

  /// Supplied at build time, e.g.
  ///   flutter run --dart-define-from-file=env.json
  static const apiHost = String.fromEnvironment('API_HOST');
  static const apiKey = String.fromEnvironment('API_KEY');
}
