import 'package:app_sales29112021/data/datasources/remote/api/cart_api.dart';
import 'package:app_sales29112021/data/datasources/remote/api/order_api.dart';
import 'package:dio/dio.dart';

class CartRepository{
  late CartApi _api;

  CartRepository(CartApi api){
    _api = api;
  }

  Future<Response> fetchListCart(){
    return _api.fetchListCart();
  }

}