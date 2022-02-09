import 'package:app_sales29112021/data/models/cart_model.dart';
import 'package:app_sales29112021/data/repositories/cart_repository.dart';
import 'package:app_sales29112021/data/repositories/order_repository.dart';
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
    on<UpdateCart>((event, emit) async{
      try{
        emit(CartLoading());
        Response response = await _cartRepository.updateItemCart(event.orderId, event.foodId, event.quantity);
        if(response.statusCode == 200){
          emit(UpdateCartSuccess());
        }
      }on DioError catch(dioError){
        if(dioError.response != null){
          emit(UpdateCartError(message: dioError.response!.data["message"]));
        }
      }catch(e){
        emit(UpdateCartError(message: e.toString()));
      }
    });

    on<DeleteItemCart>((event, emit) async{
      try{
        emit(CartLoading());
        Response response = await _cartRepository.deleteItemCart(event.foodId);
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