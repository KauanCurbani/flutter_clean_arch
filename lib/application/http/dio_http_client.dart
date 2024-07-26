import 'package:delivery_flutter/core/http/http_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioHttpClient extends GetxController implements HttpClient {
  final Dio _dio = Dio();
  final String _baseUrl = const String.fromEnvironment("API_URL");
  // my api requires these headers
  final Map<String, dynamic> defaultHeaders = {
    "Content-Type": "application/json",
    "Handlerpartner": "faa5f8c3-8a6a-4a26-8532-0afdc3413423",
    "Appversion": "0.123",
  };

  @override
  void addHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }

  @override
  void removeAllHeaders() {
    _dio.options.headers.clear();
  }

  @override
  void removeHeader(String key) {
    _dio.options.headers.remove(key);
  }

  @override
  Future<Map<String, dynamic>> request(
      {required String url,
      required String method,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) async {
    defaultHeaders.addAll(headers ?? {});

    final response = await _dio.request(
      _baseUrl + url,
      data: body,
      options: Options(
        method: method,
        headers: defaultHeaders,
      ),
    );

    return Map.from(response.data);
  }
}
