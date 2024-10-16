import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';

import '../../../app_config.dart';
import '../../constants/api_endpoint.dart';
import '../../data/api/api_response.dart';
import '../../data/api/refresh_token_request.dart';
import '../../data/api/refresh_token_response.dart';
import '../../utils/type_defs.dart';
import '../user_data_service.dart';

part 'dio_interceptor.dart';
part 'dio_multi_part_client.dart';

/// Convenience methods to make an HTTP PATCH request.
class DioClient {
  final Dio _dio = Dio();

  DioClient({
    required AppConfig appConfig,
    List<Interceptor>? interceptors,
  }) {
    _dio.options = BaseOptions(
      baseUrl: appConfig.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {"Content-Type": "application/json"},
    );

    if (interceptors != null) _dio.interceptors.addAll(interceptors);
  }

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
