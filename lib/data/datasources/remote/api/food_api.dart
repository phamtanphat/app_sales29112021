import 'package:app_sales29112021/common/dio_client.dart';
import 'package:dio/dio.dart';

class FoodApi{
  late Dio _dio;

  FoodApi() {
    _dio = DioClient.instance.dio;
  }

  Future<Response> fetchListFoods() {
    return _dio.get("food/list/0/10");
  }

}