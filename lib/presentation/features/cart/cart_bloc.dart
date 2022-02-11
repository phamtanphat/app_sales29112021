import 'package:app_sales29112021/data/models/cart_model.dart';
import 'package:app_sales29112021/data/repositories/cart_repository.dart';
import 'package:app_sales29112021/presentation/features/cart/cart_event.dart';
import 'package:app_sales29112021/presentation/features/cart/cart_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEventBase,CartState>{

  late CartRepository _cartRepository;

  CartBloc(CartRepository repository) : super(CartState.initial()){
    _cartRepository = repository;

    on<FetchListCart>((event, emit) async{
      try{
        emit(CartState.cartLoading());
        Response response = await _cartRepository.fetchListCart();
        if(response.statusCode == 200){
          if(response.data["data"] != null){
             CartModel cartModel = CartModel.fromJson(response.data["data"]);
             emit(CartState.fetchCartSuccess(cartModel: cartModel));
          }else{
            emit(CartState.fetchCartSuccess(cartModel: null));
          }
        }
      }on DioError catch(dioError){
        if(dioError.response != null){
          emit(CartState.cartError(message: dioError.response!.data["message"]));
        }
      }catch(e){
        emit(CartState.cartError(message: e.toString()));
      }
    });
    on<UpdateCart>((event, emit) async{
      try{
        emit(CartState.cartLoading());
        Response response = await _cartRepository.updateItemCart(event.orderId, event.foodId, event.quantity);
        if(response.statusCode == 200){
          emit(CartState.updateCartSuccess());
        }
      }on DioError catch(dioError){
        if(dioError.response != null){
          emit(CartState.updateCartError(message: dioError.response!.data["message"]));
        }
      }catch(e){
        emit(CartState.updateCartError(message: e.toString()));
      }
    });

    on<DeleteItemCart>((event, emit) async{
      try{
        emit(CartState.cartLoading());
        Response response = await _cartRepository.deleteItemCart(event.foodId);
        if(response.statusCode == 200){
          if(response.data["data"] != null){
            CartModel cartModel = CartModel.fromJson(response.data["data"]);
            emit(state.copyWith(status: CartStatus.success , cartModel: cartModel));
          }else{
            emit(state.copyWith(status: CartStatus.success , cartModel: null));
          }
        }
      }on DioError catch(dioError){
        if(dioError.response != null){
          emit(CartState.deleteItemError(message: dioError.response!.data["message"]));
        }
      }catch(e){
        emit(CartState.deleteItemError(message: e.toString()));
      }
    });
  }

}