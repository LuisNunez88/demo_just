import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpClient {
  Dio dio;
  bool logsEnabled;

  HttpClient({
    required this.dio,
    this.logsEnabled = false,
  });
  void kLogs(dynamic data) {
    if (logsEnabled) {
      final String now = DateTime.now().toUtc().toString().split(' ').last;
      debugPrint("[$now]HttpCLient => ${data.toString()}");
    }
  }

  set token(String token) {
    dio.options.headers["authorization"] = token;
  }

  String get token => dio.options.headers["authorization"] ?? '';

  Future<HttpResponse<T>> request<T>(
    String path, {
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? formData,
    Map<String, String>? headers,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final response = await dio.request(
        path,
        options: Options(
          method: method,
          contentType: Headers.jsonContentType,
        ),
        queryParameters: queryParameters,
        data: formData != null ? FormData.fromMap(formData) : data,
      );

      if (parser != null) {
        return HttpResponse.success<T>(parser(response.data));
      }
      return HttpResponse.success<T>(response.data);
    } catch (e) {
      kLogs(e);
      int statusCode = 0; //
      String message = "unknown error";
      String type = "unknown";
      dynamic data;

      if (e is DioException) {
        kLogs(e.response?.data['message']);
        statusCode = -1; //
        message = e.message ?? '';
        if (e.response != null) {
          statusCode = e.response?.statusCode ?? 404;
          message =
              e.response?.data['message'] ?? 'No se pudo obtener información';
          data = e.response?.data;
        }
        type = e.type.name;
      }

      return HttpResponse.fail<T>(
        statusCode: statusCode,
        message: message,
        data: data,
        type: type,
      );
    }
  }
}

class HttpResponse<T> {
  final T? data;
  final HttpError? error;

  HttpResponse(this.data, this.error);

  static HttpResponse<T> success<T>(T data) => HttpResponse(data, null);

  static HttpResponse<T> fail<T>({
    required int statusCode,
    required String message,
    required dynamic data,
    String type = 'unknown',
  }) =>
      HttpResponse(
        null,
        HttpError(
          statusCode: statusCode,
          message: message,
          data: data,
          type: type,
        ),
      );
}

class HttpError {
  final int statusCode;
  final String message;
  final dynamic data;
  final String type;

  HttpError({
    required this.statusCode,
    required this.message,
    required this.data,
    required this.type,
  });
}
