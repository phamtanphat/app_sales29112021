import 'package:app_sales29112021/data/datasources/remote/api/authentication_api.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository{
  late AuthenticationApi _apiRequest;

  AuthenticationRepository(AuthenticationApi api){
    _apiRequest = api;
  }

  Future<Response> signIn(String email,password){
    return _apiRequest.signInRequestApi(email, password);
  }

  Future<Response> signUp(String email, String password , String address , String phone , String name){
    return _apiRequest.signUpRequestApi(email, password,address,phone,name);
  }
}