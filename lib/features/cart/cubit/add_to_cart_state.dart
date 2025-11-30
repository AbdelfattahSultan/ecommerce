import 'package:ecommerce_app/api/model/response/cart_response/cart_response.dart';

abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {
  final String message;

  AddToCartSuccess(this.message);
}

class GetCartSuccess extends AddToCartState {
  final CartResponse response;

  GetCartSuccess(this.response);
}

class AddToCartError extends AddToCartState {
  final String message;

  AddToCartError(this.message);
}