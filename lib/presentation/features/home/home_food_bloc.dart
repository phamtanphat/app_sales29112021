import 'package:app_sales29112021/data/models/food_model.dart';
import 'package:app_sales29112021/data/repositories/food_repository.dart';
import 'package:app_sales29112021/presentation/features/home/home_event.dart';
import 'package:app_sales29112021/presentation/features/home/home_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFoodBloc extends Bloc<HomeEventBase,HomeStateBase>{
  late FoodRepository _repository;

  HomeFoodBloc(FoodRepository repository) : super(HomeStateInit()){
    _repository = repository;

    on<FetchListFood>((event, emit) async{
      try{
        emit(HomeStateLoading());
        Response response = await _repository.fetchListFoods();
        if(response.statusCode == 200){
          List<FoodModel> listFoods = (response.data["data"] as List).map((e) => FoodModel.fromJson(e)).toList();
          emit(FetchListFoodSuccess(listFoods: listFoods));
        }
      }on DioError catch(dioError){
        if(dioError.response != null){
          emit(FetchListFoodError(dioError.response!.data["message"]));
        }
      }catch(e){
        emit(FetchListFoodError(e.toString()));
      }
    });

  }

}