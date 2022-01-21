import 'package:app_sales29112021/common/dio_client.dart';
import 'package:dio/dio.dart';

class AuthenticationApi {
  late Dio _dio;

  AuthenticationApi() {
    _dio = DioClient.instance.dio;
  }

  Future<Response> signRequestApi(String email, String password) {
    return _dio.post("user/sign-in", data: {
      "email": email,
      "password": password,
    });
  }
}
