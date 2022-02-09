import 'package:app_sales29112021/data/datasources/remote/api/order_api.dart';
import 'package:dio/dio.dart';

class OrderRepository{
  late OrderApi _api;

  OrderRepository(OrderApi api){
    _api = api;
  }

  Future<Response> fetchTotalCart(){
    return _api.fetchTotalCart();
  }

  Future<Response> addToCart(String foodId){
    return _api.addToCart(foodId);
  }


}