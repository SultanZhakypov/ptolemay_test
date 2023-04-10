import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  ApiClient() {
    setup();
  }
  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.openweathermap.org/',
      contentType: 'application/json',
      headers: {'Accept': 'application/json'},
    ),
  );

  Dio get dio => _dio;

  void setup() {
    final interceptors = dio.interceptors;
    interceptors.clear();

    final headerInterceptor =
        QueuedInterceptorsWrapper(onResponse: (e, handler) {
      return handler.next(e);
    }, onError: (DioError err, handler) {
      handler.next(err);
    }, onRequest: (options, handler) {
      return handler.next(options);
    });
    final logInterceptor = LogInterceptor(
      requestHeader: true,
      error: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    );

    interceptors.addAll([if (kDebugMode) headerInterceptor, logInterceptor]);
  }
}
