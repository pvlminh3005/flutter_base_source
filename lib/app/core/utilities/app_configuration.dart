enum AppFlavor { development, staging, production }

void setFlavor({
  required AppFlavor flavor,
  required String baseUrl,
  String appName = 'Example',
}) {
  AppConfig(
    flavor: flavor,
    appName: appName,
    apiUrl: baseUrl,
  );
}

class AppConfig {
  final AppFlavor flavor;
  final String appName;
  final String apiUrl;
  static AppConfig? _instance;

  factory AppConfig({
    required AppFlavor flavor,
    required String appName,
    required String apiUrl,
  }) {
    _instance ??= AppConfig._internal(flavor, appName, apiUrl);
    return _instance!;
  }

  AppConfig._internal(this.flavor, this.appName, this.apiUrl);
  static AppConfig get instance => _instance!;

  static bool get isProduction => instance.flavor == AppFlavor.production;
  static bool get isDevelopment => instance.flavor == AppFlavor.development;
  static bool get isStaging => instance.flavor == AppFlavor.staging;
}
