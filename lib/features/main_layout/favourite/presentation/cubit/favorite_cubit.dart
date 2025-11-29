import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/api/ApiManager.dart';

class FavoriteCubit extends Cubit<bool> {
  final ApiManager apiManager =ApiManager();

  FavoriteCubit({ bool initialIsFavorite = false})
    : super(initialIsFavorite);

  Future<void> toggleFavorite(String productId) async {
    final wasFavorite = state;

    try {
      if (wasFavorite) {
        await apiManager.deleteProductFromFav(productId);
      } else {
        await apiManager.addProductToFav(productId);
      }

      emit(!wasFavorite);
    } catch (e) {
      emit(wasFavorite);
    }
  }
}
