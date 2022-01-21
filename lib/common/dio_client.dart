import 'package:app_sales29112021/data/datasources/local/share_pref.dart';
import 'package:dio/dio.dart';

class DioClient{
  Dio? _dio;
  static final BaseOptions _options = BaseOptions(
    baseUrl: "https://freeapi.code4func.com/api/v1/",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static final DioClient instance = DioClient._internal();

  DioClient._internal() {
    if (_dio == null){
      _dio = Dio(_options);
      // _dio!.interceptors.add(LogInterceptor(requestBody: true));
      _dio!.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) async{
          var token = await SharePre.instance.get("token");
          if (token != null) {
            options.headers["Authorization"] = "Bearer " + token;
          }
          return handler.next(options);
        },
        onResponse: (e, handler) {
          return handler.next(e);
        },
        onError: (e, handler) {
          return handler.next(e);
        },
      ));
    }
  }

  Dio get dio => _dio!;
}