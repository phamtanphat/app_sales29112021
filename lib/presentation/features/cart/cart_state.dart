import 'package:app_sales29112021/data/models/cart_model.dart';
import 'package:equatable/equatable.dart';

enum CartStatus { initial, loading, fetchCartSuccess, failure }

class CartState extends Equatable {
  CartStatus status;
  CartModel? cartModel = null;
  String? message = null;

  CartState._({this.status = CartStatus.initial, this.cartModel, this.message});

  CartState copyWith({CartStatus status = CartStatus.initial, CartModel? cartModel, String? message}) {
    return CartState._(
        status: status,
        cartModel: cartModel ?? this.cartModel,
        message: message ?? this.message,
    );
  }

  CartState.initial() : this._();
  CartState.cartLoading() : this._(status : CartStatus.loading);
  CartState.fetchCartSuccess({required CartModel? cartModel}) : this._(cartModel: cartModel,status : CartStatus.fetchCartSuccess);
  CartState.cartError({required String? message}) : this._(message: message ,status : CartStatus.failure);
  // CartState.updateCartSuccess() : this._();
  // CartState.updateCartError() : this._();

  @override
  List<Object?> get props => [];
}