import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/api/model/response/favorite_response/favorite_response.dart';

import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final ApiManager apiManager = ApiManager();

  FavoriteCubit() : super(FavoriteInitial());

  Future<void> addProductToFav(String productId) async {
    emit(FavoriteLoading());
    try {
      FavoriteResponse response = await apiManager.addProductToFav(productId);
      emit(FavoriteSuccess(response));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
