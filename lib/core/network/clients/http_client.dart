import 'package:http/http.dart' as http;

class HttpClient {
  final http.Client _client = http.Client();

  Future<http.Response> get(String url) {
    return _client.get(Uri.parse(url));
  }

  Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) {
    return _client.post(Uri.parse(url), headers: headers, body: body);
  }

  Future<http.Response> put(
    String url, {
    Map<String, String>? headers,
    Object? body,
  }) {
    return _client.put(Uri.parse(url), headers: headers, body: body);
  }

  Future<http.Response> delete(String url, {Map<String, String>? headers}) {
    return _client.delete(Uri.parse(url), headers: headers);
  }
}
