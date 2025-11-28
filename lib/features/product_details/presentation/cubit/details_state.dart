import 'package:ecommerce_app/api/model/response/products_details/productDetails_response.dart';

abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetails productDetails;

  ProductDetailsSuccess(this.productDetails);
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError(this.message);
}
