import 'package:app_sales29112021/data/models/cart_model.dart';
import 'package:app_sales29112021/data/repositories/cart_repository.dart';
import 'package:app_sales29112021/presentation/features/cart/cart_event.dart';
import 'package:app_sales29112021/presentation/features/cart/cart_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEventBase,CartStateBase>{

  late CartRepository _cartRepository;

  CartBloc(CartRepository repository) : super(CartInit()){
    _cartRepository = repository;

    on<FetchListCart>((event, emit) async{
      try{
        emit(CartLoading());
        Response response = await _cartRepository.fetchListCart();
        if(response.statusCode == 200){
          if(response.data["data"] != null){
             CartModel cartModel = CartModel.fromJson(response.data["data"]);
             emit(FetchCartSuccess(cartModel: cartModel));
          }else{
            emit(FetchCartSuccess(cartModel: null));
          }
        }
      }on DioError catch(dioError){
        if(dioError.response != null){
          emit(FetchCartError(message: dioError.response!.data["message"]));
        }
      }catch(e){
        emit(FetchCartError(message: e.toString()));
      }
    });
  }

}