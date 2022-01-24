import 'package:app_sales29112021/data/datasources/remote/resource_type.dart';
import 'package:app_sales29112021/data/models/food_model.dart';
import 'package:app_sales29112021/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeStateBase extends Equatable{}


class HomeStateInit extends HomeStateBase{

  @override
  List<Object?> get props => [];

}
class HomeStateLoading extends HomeStateBase{

  @override
  List<Object?> get props => [];

}

class FetchListFoodSuccess extends HomeStateBase{

  late List<FoodModel> listFoods;

  FetchListFoodSuccess({required this.listFoods});

  @override
  List<Object?> get props => [listFoods];

}

class FetchListFoodError extends HomeStateBase{

  late String message;

  FetchListFoodError(String message){
    this.message = message;
  }

  @override
  List<Object?> get props => [message];

}