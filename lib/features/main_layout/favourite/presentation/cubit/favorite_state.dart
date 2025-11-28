import 'package:ecommerce_app/api/model/response/favorite_response/favorite_response.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final FavoriteResponse response;

  FavoriteSuccess(this.response);
}

class FavoriteError extends FavoriteState {
  final String message;

  FavoriteError(this.message);
}
