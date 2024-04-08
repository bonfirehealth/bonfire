enum AppFlavor { development, staging, production }

class FlavorValues {
  const FlavorValues({
    required this.currentFlavor,
  });

  /// Current flavor of the app...
  final String currentFlavor;
}

class FlavorConfig {
  factory FlavorConfig({
    required AppFlavor flavor,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(flavor, values);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.values);

  /// Flavor name as enum of`AppFlavor`..
  final AppFlavor flavor;

  /// Contains all the properties as mentioned in the `FlavorValues`
  final FlavorValues values;

  static FlavorConfig? _instance;

  static FlavorConfig? get instance => _instance;

  /// Current flavor of the app...
  static String currentFlavor() => _instance!.flavor.name;

  /// Is the app in `development` phase
  static bool isDevelopment() => _instance!.flavor == AppFlavor.development;

  /// Is the app in `staging` phase
  static bool isStaging() => _instance!.flavor == AppFlavor.staging;

  /// Is the app in `production` phase
  static bool isProduction() => _instance!.flavor == AppFlavor.production;

  static bool isDebug() => true;
}
