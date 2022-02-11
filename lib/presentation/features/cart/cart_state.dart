import 'package:app_sales29112021/data/models/cart_model.dart';
import 'package:equatable/equatable.dart';

enum CartStatus { initial, loading, success , updateSuccess , deleteSuccess, failure }

class CartState extends Equatable {
  CartStatus? status = null;
  CartModel? cartModel = null;
  String? message = null;

  CartState._({this.status, this.cartModel, this.message});

  CartState copyWith({CartStatus? status, CartModel? cartModel, String? message}) {
    return CartState._(
        status: status ?? this.status,
        cartModel: cartModel ?? this.cartModel,
        message: message ?? this.message,
    );
  }

  CartState.initial() : this._(status : CartStatus.initial);
  CartState.cartLoading() : this._(status : CartStatus.loading);
  CartState.fetchCartSuccess({required CartModel? cartModel}) : this._(cartModel: cartModel,status : CartStatus.success);
  CartState.cartError({required String? message}) : this._(message: message ,status : CartStatus.failure);
  CartState.updateCartSuccess() : this._(status : CartStatus.updateSuccess);
  CartState.updateCartError({required String? message}) : this._(message: message ,status : CartStatus.failure);
  CartState.deleteItemError({required String? message}) : this._(message: message ,status : CartStatus.failure);

  @override
  List<Object?> get props => [status,cartModel,message];
}