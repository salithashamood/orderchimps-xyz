import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:xyz/core/const_variable.dart';
import 'package:xyz/core/enum_value.dart';

class HttpRequest {
  final Dio dio = Dio();

  HttpRequest() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Tz'] = 'Europe/London';
          return handler.next(options);
        },
      ),
    );
  }

  Future<Response> createRequest(
      HttpRequstMethod httpRequstMethod, String subUrl,
      {Object? body}) async {
    try {
      Response response;
      switch (httpRequstMethod) {
        case HttpRequstMethod.GET:
          response = await dio.get(baseUrl + subUrl);
          break;
        case HttpRequstMethod.POST:
          response = await dio.post(
            baseUrl + subUrl,
            data: body,
          );
          break;
        case HttpRequstMethod.PUT:
          response = await dio.put(baseUrl + subUrl, data: body);
          break;
        case HttpRequstMethod.DELETE:
          response = await dio.delete(baseUrl + subUrl);
          break;
      }
      return response;
    } on DioException catch (e) {
      debugPrint("Code : ${e.response?.statusCode}");
      throw Exception("Faild to create request");
    }
  }

  void addTokenToHeader(String token) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token' ;
          return handler.next(options);
        },
      ),
    );
  }
}
