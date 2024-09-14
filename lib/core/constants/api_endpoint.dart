class ApiEndpoint {
  ApiEndpoint._();

  /// Base
  static const baseProduction = "https://production.com.np/";
  static const baseDevelopment = "https://development.com.np/";
  static const baseStaging = "https://staging.com.np/";
  static const auth = "api/auth/";

  // Auth
  static const login = "${auth}login";
  static const refreshToken = "${auth}refreshToken";
  static const checkAuth = "${auth}check-auth";
}
