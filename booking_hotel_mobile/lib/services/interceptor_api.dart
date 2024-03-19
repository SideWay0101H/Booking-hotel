import 'dart:developer';

import 'package:booking_hotel_ui/core/global.dart';
import 'package:dio/dio.dart';

class InterceptorApi extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    if (Global.sharedServices.getStringValue(Headers.jsonContentType) != '') {
      options.headers[''] = Global.session;
    }
    log("URL: ${options.baseUrl}/${options.path}");
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    log('********** API ERROR - START *******');
    log(err.message.toString());
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    log('******* API RESPONSE - START *********');
    log(response.data.toString());
  }
}
