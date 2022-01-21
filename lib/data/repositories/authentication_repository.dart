import 'package:app_sales29112021/data/datasources/remote/api/authentication_api.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository{
  late AuthenticationApi _apiRequest;

  AuthenticationRepository(AuthenticationApi api){
    _apiRequest = api;
  }

  Future<Response> signIn(String email,password){
    return _apiRequest.signRequestApi(email, password);
  }
}