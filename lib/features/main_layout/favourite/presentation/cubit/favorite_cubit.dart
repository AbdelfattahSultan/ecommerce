import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/api/ApiManager.dart';

class FavoriteCubit extends Cubit<bool> {
  final ApiManager apiManager = ApiManager();

  FavoriteCubit() : super(false);

  Future<void> addProductToFav(String productId) async {
    try {
      await apiManager.addProductToFav(productId);
      emit(true);
    } catch (e) {
      emit(false);
    }
  }
}
