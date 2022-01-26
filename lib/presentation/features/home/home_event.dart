import 'package:equatable/equatable.dart';

abstract class HomeEventBase extends Equatable{}


class FetchListFood extends HomeEventBase{

  FetchListFood();

  @override
  List<Object?> get props => [];

}

class FetchTotalCart extends HomeEventBase{

  FetchTotalCart();

  @override
  List<Object?> get props => [];

}

class AddToCart extends HomeEventBase{
  late String foodId;

  AddToCart({required this.foodId});

  @override
  List<Object?> get props => [foodId];

}