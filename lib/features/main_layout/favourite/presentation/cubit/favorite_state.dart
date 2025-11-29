import 'package:ecommerce_app/api/model/response/products_respone/ProductsResponse.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {
  
}

class FavoriteSuccess extends FavoriteState {
  final List<Product> products;
  FavoriteSuccess(this.products);
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}
