import 'package:app_sales29112021/data/models/cart_model.dart';
import 'package:app_sales29112021/data/models/food_model.dart';
import 'package:app_sales29112021/data/repositories/cart_repository.dart';
import 'package:app_sales29112021/data/repositories/food_repository.dart';
import 'package:app_sales29112021/presentation/features/home/home_event.dart';
import 'package:app_sales29112021/presentation/features/home/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCartBloc extends Bloc<HomeEventBase,HomeStateBase>{
  late CartRepository _cartRepository;

  HomeCartBloc(CartRepository cartRepository) : super(HomeStateInit()){
    _cartRepository = cartRepository;

    on<FetchTotalCart>((event, emit) async{
      try{
        emit(HomeStateLoading());
        Response response = await _cartRepository.fetchTotalCart();
        if(response.statusCode == 200){
          CartModel cartModel = CartModel.fromJson(response.data['data']);
          emit(FetchTotalSuccess(cartModel: cartModel));
        }
      }on DioError catch(dioError){
        if (dioError.response != null){
          if(dioError.response!.statusCode == 401){
            emit(FetchTotalError(dioError.response!.data["message"],401));
          }else if(dioError.response!.statusCode == 404){
            emit(FetchTotalSuccess(cartModel: CartModel()));
          }else{
            emit(FetchTotalError(dioError.response!.data["message"],dioError.response!.statusCode!));
          }
        }
      }catch(e){
        emit(FetchTotalError(e.toString(),0));
      }
    });
  }

}