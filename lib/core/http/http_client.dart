abstract class HttpClient {
  Future<Map<String, dynamic>> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  });

  void addHeader(String key, String value);
  void removeHeader(String key);
  void removeAllHeaders();
  
}
