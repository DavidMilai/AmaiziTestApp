import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioApi {
  Dio dio;

  DioApi(String apiUrl) {
    dio = Dio();
    dio.options.baseUrl = apiUrl;
    dio.interceptors.add(InterceptorsWrapper(onRequest: _requestIntercept));
    dio.interceptors.add(InterceptorsWrapper(onResponse: _responseIntercept));
    dio.interceptors.add(InterceptorsWrapper(onError: _errorIntercept));
  }

  _requestIntercept(RequestOptions options, handler) async {
    debugPrint(
        "REQUEST: ${options?.method}: ${options?.baseUrl}${options?.path} ${options?.queryParameters}");
    debugPrint(
        "BODY: ${(options?.data != null && !(options?.data is FormData)) ? json.encode(options?.data) : ""}");

    return handler.next(options); //continue
  }

  _responseIntercept(Response response, handler) async {
    debugPrint("${response.requestOptions.path} ${response?.data}");
    return handler.next(response); // continue
  }

  _errorIntercept(DioError error, handler) async {
    debugPrint("${error.requestOptions.path} ${error.response?.data}");
    return handler.next(error);
  }
}
