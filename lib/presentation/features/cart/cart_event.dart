import 'package:equatable/equatable.dart';

abstract class CartEventBase extends Equatable {
}

class FetchListCart extends CartEventBase {
  @override
  List<Object?> get props => [];

}

class UpdateCart extends CartEventBase {

  late String orderId;
  late String foodId;
  late int quantity;

  UpdateCart(
      {required this.orderId, required this.foodId, required this.quantity});

  @override
  List<Object?> get props => [orderId, foodId, quantity];

}