import 'package:app_sales29112021/data/models/cart_model.dart';
import 'package:equatable/equatable.dart';

abstract class CartStateBase extends Equatable{

}

class CartInit extends CartStateBase{
  @override
  List<Object?> get props => [];
}

class CartLoading extends CartStateBase{
  @override
  List<Object?> get props => [];
}

class FetchCartSuccess extends CartStateBase{
  late CartModel? cartModel;

  FetchCartSuccess({required this.cartModel});

  @override
  List<Object?> get props => [cartModel];

}

class FetchCartError extends CartStateBase{
  late String message;

  FetchCartError({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpdateCartSuccess extends CartStateBase{

  UpdateCartSuccess();

  @override
  List<Object?> get props => [];

}

class UpdateCartError extends CartStateBase{
  late String message;

  UpdateCartError({required this.message});

  @override
  List<Object?> get props => [message];
}