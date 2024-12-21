import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

import '../../constants/api_endpoint.dart';
import '../../data/api/api_response.dart';
import '../../data/api/refresh_token_request.dart';
import '../../data/api/refresh_token_response.dart';
import '../../utils/type_defs.dart';
import '../user_data_service.dart';

part 'authentication_interceptor.dart';
part 'dio_multi_part_client.dart';

/// Convenience methods to make an HTTP PATCH request.
abstract class DioClient {
  Future<Response> get<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  });

  Future<Response> post<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  });

  Future<Response> put<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  });

  Future<Response> patch<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  });

  Future<Response> delete<T>(
    String path, {
    final Object? data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
  });
}
