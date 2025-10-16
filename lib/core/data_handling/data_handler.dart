import 'dart:developer' show log;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import '../data_states/data_state.dart';
import '../utils/type_defs.dart';

part 'error_handler.dart';

/// A centralized handler for data operations, providing safe execution of
/// API calls, network fallback strategies, and error handling.
///
/// Wraps all operations in a [DataState] to consistently represent
/// success, failure, or loading states across the application.
class DataHandler {
  DataHandler._();

  /// Executes an API request while handling network errors, formatting issues,
  /// and response parsing. Wraps the result in a [DataState].
  ///
  /// Type [T] is the final return type of the API call (e.g., a model or list of models).
  /// Type [R] is the raw deserialization type used in [fromJson]. Typically, [T] and [R]
  /// are the same when returning a single model. When returning a list of models,
  /// [T] would be `List<R>`.
  ///
  /// Parameters:
  /// - [request]: A function that performs the actual API request.
  /// - [fromJson]: A deserialization function to convert JSON (Map) into an object of type [R].
  /// - [isStandardResponse]: If `true`, assumes the API response is wrapped in a standard
  ///   structure (e.g., `{ data: ..., message: ... }`) and extracts the inner `data` field.
  /// - [responseDataKey]: The key used to extract the data from the response when
  ///   [isStandardResponse] is `true`.
  /// - [staticData]: Optional custom value to return instead of processing the API response.
  ///   Useful when you want to bypass parsing and directly return a predefined value.
  /// - [useStaticDataAsNull]: If `true`, [staticData] will be used as the result even if it is `null`.
  ///   This allows you to explicitly return `null` as static data. If `false`, [staticData]
  ///   is only used if it is not `null`.
  static FutureData<T> safeApiCall<T, R>({
    required Future<Response> Function() request,
    R Function(Map<String, dynamic> json)? fromJson,
    bool isStandardResponse = true,
    String responseDataKey = 'data',
    T? staticData,
    bool useStaticDataAsNull = false,
  }) {
    return ErrorHandler.handleException(() async {
      final Response response = await request();
      dynamic rawData = response.data;
      String? responseMessage;
      T? data;

      // Handle standard API response structure
      if (isStandardResponse && staticData == null) {
        if (rawData is! Map<String, dynamic>) {
          return FailureState.badResponse(
            message:
                'Expected standard response format but got ${rawData.runtimeType}',
          );
        }

        // Returns bad response failure state if the response structure is not standard
        if (!rawData.containsKey(responseDataKey)) {
          return FailureState.badResponse(
            message: 'Response missing expected key: "$responseDataKey"',
          );
        }

        responseMessage = rawData['message'];
        rawData = rawData[responseDataKey];
      }

      // Handle static data return
      if (staticData != null || useStaticDataAsNull) {
        data = staticData;
      }
      // Handle JSON deserialization
      else if (fromJson != null) {
        if (rawData is Map<String, dynamic>) {
          data = fromJson(rawData) as T;
        } else if (rawData is List) {
          data = rawData.map((json) => fromJson(json)).toList() as T;
        } else {
          return FailureState(
            message:
                'Expected Map or List for deserialization but got ${rawData.runtimeType}',
            errorType: ErrorType.formatError,
          );
        }
      }
      // Handle raw data without deserialization
      else if (rawData is T) {
        data = rawData;
      } else {
        return FailureState(
          message: 'Type mismatch: Expected $T, got ${rawData.runtimeType}',
          errorType: ErrorType.formatError,
        );
      }

      return SuccessState(
        data: data,
        message: responseMessage,
        statusCode: response.statusCode,
      );
    });
  }

  /// Fetches data with a network fallback strategy.
  ///
  /// Executes [remoteCallback] if internet is available.
  /// If successful and [onRemoteSuccess] is provided, it gets called with the result.
  /// If offline, executes [localCallback] if provided; otherwise returns network [FailureState].
  static FutureData<T> fetchWithFallback<T>(
    bool isInternetConnected, {
    required FutureData<T> Function() remoteCallback,
    Function(T data)? onRemoteSuccess,
    FutureData<T> Function()? localCallback,
  }) async {
    if (isInternetConnected) {
      final dataState = await remoteCallback();
      final data = dataState.data;

      // Optional: Perform an action on successful remote fetch (e.g., cache the data)
      if (data != null && onRemoteSuccess != null) onRemoteSuccess(data);
      return dataState;
    }

    // Fallback to local data source or return no internet error
    return await localCallback?.call() ?? FailureState.noInternet();
  }

  /// Fetches and transforms data with a network fallback strategy.
  /// This is specifically for converting Data Layer DTOs to Domain Models.
  ///
  /// Executes [remoteCallback] if internet is available, then transforms the result
  /// using [toDomain]. If offline, executes [localCallback] and transforms its result.
  /// If no fallback is available, returns network [FailureState].
  ///
  /// [onRemoteSuccess] provides a hook to use the raw DTO before it is transformed
  /// (e.g., for caching the original API response).
  static FutureData<R> fetchWithFallbackAndMap<T, R>(
    bool isInternetConnected, {
    required FutureData<T> Function() remoteCallback,
    required R Function(T data) toDomain,
    Function(T data)? onRemoteSuccess,
    FutureData<T> Function()? localCallback,
  }) async {
    final DataState<T> dataState = await fetchWithFallback(
      isInternetConnected,
      remoteCallback: remoteCallback,
      onRemoteSuccess: onRemoteSuccess,
      localCallback: localCallback,
    );

    // Transform the DataState containing the DTO (T) to a DataState containing the Domain Model (R)
    return dataState.mapData(toDomain);
  }

  /// Fetches and transforms data from a local data source.
  ///
  /// Executes [localCallback], then transforms the successful result
  /// using [toDomain]. This is ideal for retrieving data from a local cache
  /// and converting it from a Data Transfer Object (DTO) to a Domain Model.
  static FutureData<R> fetchFromLocalAndMap<T, R>({
    required FutureData<T> Function() localCallback,
    required R Function(T data) toDomain,
  }) async {
    // Error handling is expected to be implemented within the localCallback,
    // similar to how remote data sources handle exceptions.
    final dataState = await localCallback();
    return dataState.mapData(toDomain);
  }
}
