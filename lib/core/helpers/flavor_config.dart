enum Flavor { dev, staging, prod }
class FlavorConfig {
final Flavor flavor;
  final String baseUrl;
  final String imageUrl;
  final String appName;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String baseUrl,
    required String imageUrl,
    required String appName,
  }) {
    _instance = FlavorConfig._internal(flavor, baseUrl, appName,imageUrl);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.baseUrl, this.appName,this.imageUrl);

  static FlavorConfig get instance => _instance!;
}