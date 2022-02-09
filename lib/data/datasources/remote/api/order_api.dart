import 'package:app_sales29112021/common/dio_client.dart';
import 'package:dio/dio.dart';

class OrderApi{
  late Dio _dio;

  OrderApi() {
    _dio = DioClient.instance.dio;
  }

  Future<Response> fetchTotalCart() {
    return _dio.get("order/count/shopping-cart");
  }

  Future<Response> addToCart(String foodId) {
    return _dio.post("order/add-to-cart", data: {
      "foodId": foodId
    });
  }



}