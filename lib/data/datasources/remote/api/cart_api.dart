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

  Future<Response> updateItemCart(String orderId , String foodId , int quantity) {
    return _dio.post("order/update", data: {
      "orderId": orderId,
      "foodId": foodId,
      "quantity": quantity
    });
  }

  Future<Response> deleteItemCart(String foodId) {
    return _dio.delete("order/delete", data: {
      "foodId": foodId,
    });
  }

  Future<Response> confirm(String orderId) {
    return _dio.post("order/confirm", data: {
      "orderId": orderId,
      "status": "CONFIRM",
    });
  }
}