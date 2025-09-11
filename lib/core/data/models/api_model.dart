import 'package:dio/dio.dart';

class ApiModel<T extends Object?> {
  final T data;
  final int statusCode;
  final bool success;
  final String message;

  ApiModel({
    required this.data,
    required this.statusCode,
    required this.success,
    required this.message,
  });

  factory ApiModel.fromResponse(Response response) {
    Map<String, dynamic> data = response.data;
    int statusCode = response.statusCode ?? 0;

    return ApiModel<T>(
      data: data['data'] as T,
      statusCode: statusCode,
      success: data['success'] as bool,
      message: data['message'] as String,
    );
  }
}
