import 'package:ecommerce_app/api/model/response/cart_response/cart_response.dart';


abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartResponse cart;

  CartSuccess(this.cart);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
