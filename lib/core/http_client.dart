import 'package:dio/dio.dart';

class HttpClient {
  static Future<Response> get({required String url}) async {
    try {
      return await Dio().get(url);
    } catch (e) {
      rethrow;
    }
  }
}
