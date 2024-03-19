import 'package:booking_hotel_ui/core/global.dart';
import 'package:booking_hotel_ui/core/url.dart';
import 'package:booking_hotel_ui/services/interceptor_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ApiBase {
  Dio _dio = Dio();
  ApiBase() {
    BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {},
      contentType: 'multipart/form-data;application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    _dio.interceptors.add(InterceptorApi());
  }
  Future<dynamic> get(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      final response = await _dio.get('$baseUrl/$url',
          queryParameters: queryParameters, options: options);
      return response.data;
    } on DioError catch (ex) {
      debugPrint(ex.toString());
      print(ex);
    }
  }

  Future<dynamic> post(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      Options requestOptions = options ?? Options();
      requestOptions.headers = requestOptions.headers ?? {};
      var authorization = getAuthorization();
      if (authorization != null) {
        requestOptions.headers!.addAll(authorization);
      }
      final response = await _dio.post('$baseUrl$url',
          data: data,
          queryParameters: queryParameters,
          options: requestOptions);
      // mã hết hạn thì dùng refresh_token
      if (response.statusCode == 419) {
        // Global.sharedServices.remove('token');
        final responseToken = await _dio.post('${baseUrl}v1/auth/refresh-token',
            data: {
              "access_token": Global.sharedServices.getStringValue('access_token'),
              "refresh_token": Global.sharedServices.getStringValue('refresh_token')
            },
            options: options);
            if(response.statusCode == 400){
              Global.sharedServices.remove('access_token');
              Global.sharedServices.remove('refresh_token');
            }
            Global.sharedServices.setStringValue('token', responseToken.data["token"],);
      }
      return response.data;
    } on DioError catch (ex) {
      debugPrint(ex.message);
    }
  }

  Future<dynamic> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        '$baseUrl/$url',
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioError catch (ex) {
      print(ex);
    }
  }

  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        '$baseUrl/$url',
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response.data;
    } on DioError catch (ex) {
      print(ex);
    }
  }

  Map<String, dynamic>? getAuthorization() {
    var headers = <String, dynamic>{};
    // Lấy từ storage
    String token = Global.sharedServices.getStringValue("access_token");
    // String token =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJ6enp6emluODQxQGdtYWlsLmNvbSIsImlhdCI6MTY5OTk1MTUyNX0.sw2hc6Xp_IS9f8L9eYuxgLM9HRXrjEJmJgFPXWGMhi8";

    headers["Authorization"] = 'Bearer $token';
    return headers;
  }
}
