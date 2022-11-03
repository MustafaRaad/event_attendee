import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singletondone
  static final NetworkUtil _instance = NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  Future<dynamic> get(String url,
      {required Map<String, String> headers, encoding}) {
    return http
        .get(Uri.parse(url), headers: headers)
        .timeout(const Duration(seconds: 15))
        .then((http.Response response) {
      return response;
    });
  }

  Future<dynamic> post(String url, {required Map headers, body, encoding}) {
    return http
        .post(Uri.parse(url),
            body: jsonEncode(body), headers: Map<String, String>.from(headers))
        .timeout(const Duration(seconds: 30))
        .then((http.Response response) {
      return response;
    }).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        // time has run out, do what you wanted to do
        throw Exception("لا يمكن الوصول للخادم ... تأكد من اتصالك بالانترنيت");
      },
    );
  }

  Future<dynamic> put(String url,
      {required Map<String, String> headers, body, encoding}) {
    return http
        .put(Uri.parse(url), body: jsonEncode(body), headers: headers)
        .timeout(const Duration(seconds: 15))
        .then((http.Response response) {
      return response;
    }).timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        // time has run out, do what you wanted to do
        throw Exception("لا يمكن الوصول للخادم ... تأكد من اتصالك بالانترنيت");
      },
    );
  }
}
