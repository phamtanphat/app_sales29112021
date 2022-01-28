import 'package:app_sales29112021/common/dio_client.dart';
import 'package:dio/dio.dart';

class CartApi{
  late Dio _dio;

  CartApi() {
    _dio = DioClient.instance.dio;
  }

  Future<Response> fetchListCart() {
    return _dio.get("order/shopping-cart");
  }
}