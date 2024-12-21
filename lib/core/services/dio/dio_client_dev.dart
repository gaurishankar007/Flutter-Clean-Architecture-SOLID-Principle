import 'package:alice/alice.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../app_configuration.dart';
import '../navigation/navigation_service.dart';
import 'dio_client.dart';

@LazySingleton(as: DioClient, env: [Flavor.staging, Flavor.development])
class DevDioClientImplementation implements DioClient {
  final Dio _dio = Dio();

  DevDioClientImplementation({
    required AppConfiguration appConfig,
    required AuthenticationInterceptor authenticationInterceptor,
  }) {
    _dio.options = BaseOptions(
      baseUrl: appConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {"Content-Type": "application/json"},
    );

    _dio.interceptors.addAll([
      authenticationInterceptor,
      Alice(
        navigatorKey: NavigationUtil.I.navigatorKey,
        showNotification: true,
        showInspectorOnShake: true,
      ).getDioInterceptor(),
      AwesomeDioInterceptor(
        logResponseHeaders: false,
        logRequestTimeout: false,
      ),
    ]);
  }

  @override
  Future<Response> get<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async =>
      await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

  @override
  Future<Response> post<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async =>
      await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  @override
  Future<Response> put<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async =>
      await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  @override
  Future<Response> patch<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async =>
      await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

  @override
  Future<Response> delete<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
  }) async =>
      await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
}
