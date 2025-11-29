import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  ApiManager apiManager = ApiManager();
  AddToCartCubit() : super(AddToCartInitial());


  Future<void> addProductToCart(String productId) async {
    try {
      var response = await apiManager.addProductToCart(productId);

      emit(AddToCartSuccess(response.message));
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }
}
