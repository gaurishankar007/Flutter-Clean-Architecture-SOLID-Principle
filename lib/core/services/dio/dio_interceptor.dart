part of 'dio_client.dart';

/// Modifies http requests and responses. Used to
/// * Add headers
/// * Modify data
/// * Refresh tokens
class DioInterceptor extends Interceptor {
  final Dio dio;
  final UserDataService userDataService;

  DioInterceptor({
    required this.dio,
    required this.userDataService,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// Add authorization token if the user is logged in
    if (userDataService.isLoggedIn) {
      options.headers.addAll({
        "Authorization": "JWT ${userDataService.userData.accessToken}",
      });
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    /// If the error contains a status code of 401.
    /// That means token is expired.
    if (err.response?.statusCode == 401) {
      String? accessToken;

      /// Try to refresh access token.
      /// If refreshing token is failed, then log out the user.
      try {
        accessToken = await _refreshToken(err.requestOptions);
      } on DioException catch (error) {
        userDataService.logOut();
        return super.onError(error, handler);
      } catch (error) {
        userDataService.logOut();
        if (kDebugMode) log("Token refresh failed, ${error.toString()}");
      }

      /// If token refreshing is successful,
      /// update access token and retry the request.
      if (accessToken != null) {
        userDataService.refreshAccessToken(accessToken);

        try {
          Response response = await _retryRequest(err.requestOptions);
          return handler.resolve(response);
        } on DioException catch (error) {
          return super.onError(error, handler);
        } catch (error) {
          if (kDebugMode) log("Request retry failed, ${error.toString()}");
        }
      }
    }

    return super.onError(err, handler);
  }

  /// This flag is to prevent multiple refresh token requests.
  /// If the request is in progress then it does not make another request
  bool isTokenBeingRefreshed = false;
  Future<String?> _refreshToken(RequestOptions requestOptions) async {
    /// If token is being refreshed, don't refresh again
    if (isTokenBeingRefreshed) return null;
    isTokenBeingRefreshed = true;
    String? accessToken;

    final request = RefreshTokenRequest(
      refreshToken: userDataService.userData.refreshToken,
    );
    final response = await dio.post(
      ApiEndpoint.refreshToken,
      data: request.toJson(),
      options: Options(headers: requestOptions.headers),
    );

    /// If api response is successful, return the new accessToken
    ApiResponse<Map<String, dynamic>> apiResponse =
        ApiResponse.fromResponse(response);
    if (apiResponse.success) {
      final tokenResponse = RefreshTokenResponse.fromJson(apiResponse.data);
      accessToken = tokenResponse.accessToken;
    }

    isTokenBeingRefreshed = false;
    return accessToken;
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    /// Reset authorization header
    requestOptions.headers.remove("Authorization");
    requestOptions.headers.addAll({
      "Authorization": "JWT ${userDataService.userData.accessToken}",
    });

    /// RequestOptions with the same method, path, data,
    /// query parameters, but with new access token.
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    /// Retry the request with the new requestOptions.
    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
