import 'dart:io';
import 'package:ctmax_upai/utils/constants.dart';
import 'package:ctmax_upai/utils/shared_prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api {
  bool auth;
  Api({this.auth = false});

  final _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.123.100:8001/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  ));

  Future<Response> get(String path) async {
    debugPrint('GET auth: $auth get: $path');
    final response =
        await _dio.get(path, options: Options(headers: await _header(auth)));
    debugPrint('GET Reponse status code: ${response.statusCode}');
    return response;
  }

  Future<Response> post(String path, {payload}) async {
    debugPrint('POST auth: $auth get: $path payload: $payload');
    final response = await _dio.post(path,
        data: payload, options: Options(headers: await _header(auth)));
    debugPrint('POST Reponse status code: $response');
    return response;
  }

  Future<Response> put(String path, {payload}) async {
    debugPrint('PUT auth: $auth get: $path payload: $payload');
    final response = await _dio.put(path,
        data: payload, options: Options(headers: await _header(auth)));
    debugPrint('PUT Reponse status code: ${response.statusCode}');
    return response;
  }

  Future<Response> delete(String path, {payload}) async {
    final response =
        await _dio.delete(path, options: Options(headers: await _header(auth)));
    debugPrint('DELETE Reponse status code: ${response.statusCode}');
    return response.data;
  }

  Future<Map<String, String>> _header(auth) async {
    var token = await getPrefsData(PREF_TOKEN_KEY) ?? {};
    return {
      HttpHeaders.contentTypeHeader: "application/json",
      if (auth) ...{"Authorization": "Bearer  ${token['access']}"}
    };
  }
}
