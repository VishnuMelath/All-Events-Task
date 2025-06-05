import 'dart:convert';
import 'package:http/http.dart';

class APIServices {
  static const baseUrl = 'https://allevents.s3.amazonaws.com/tests/';

  static Future<Response> getAPIWithoutToken(String url) async {
    final response =
        await get(
          Uri.parse(baseUrl + url),
          headers: {'Content-type': 'application/json;charset=utf-8'},
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> getAPIWithToken(String url, String token) async {
    final response =
        await get(
          Uri.parse(baseUrl + url),
          headers: {
            'Content-type': 'application/json;charset=utf-8',
            'authorization': 'Bearer $token',
          },
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> postAPIWithoutToken(
    String url,
    dynamic body, [
    String? cookies,
  ]) async {
    final response =
        await post(
          Uri.parse(baseUrl + url),
          headers: {
            'Cookie': cookies ?? '',
            'Content-type': 'application/json;charset=utf-8',
          },
          body: jsonEncode(body),
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> postWithToken(
    String url,
    String token,
    dynamic body,
  ) async {
    final response =
        await post(
          Uri.parse(baseUrl + url),
          headers: {
            'Content-type': 'application/json;charset=utf-8',
            'authorization': 'Bearer $token',
          },
          body: jsonEncode(body),
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> putAPIWithoutToken(String url, dynamic body) async {
    final response =
        await put(
          Uri.parse(baseUrl + url),
          headers: {'Content-type': 'application/json;charset=utf-8'},
          body: jsonEncode(body),
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> putWithToken(
    String url,
    String token,
    dynamic body,
  ) async {
    final response =
        await put(
          Uri.parse(baseUrl + url),
          headers: {
            'Content-type': 'application/json;charset=utf-8',
            'authorization': 'Bearer $token',
          },
          body: jsonEncode(body),
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> patchWithoutToken(String url, dynamic body) async {
    final response =
        await patch(
          Uri.parse(baseUrl + url),
          headers: {'Content-type': 'application/json;charset=utf-8'},
          body: jsonEncode(body),
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> patchWithToken(
    String url,
    String token,
    dynamic body,
  ) async {
    final response =
        await patch(
          Uri.parse(baseUrl + url),
          headers: {
            'Content-type': 'application/json;charset=utf-8',
            'authorization': 'Bearer $token',
          },
          body: jsonEncode(body),
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> deleteAPIWithToken(
    String url,
    String token,
    Map body,
  ) async {
    final response =
        await delete(
          Uri.parse(baseUrl + url),
          headers: {
            'Content-type': 'application/json;charset=utf-8',
            'authorization': 'Bearer $token',
          },
          body: jsonEncode(body),
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }

  static Future<Response> deleteAPIWithoutToken(String url) async {
    final response =
        await delete(
          Uri.parse(baseUrl + url),
          headers: {'Content-type': 'application/json;charset=utf-8'},
        ).timeout(
          const Duration(seconds: 8),
          onTimeout: () {
            throw 'Sever is taking too long to respond';
          },
        );
    return response;
  }
}
