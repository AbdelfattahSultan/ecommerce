import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/features/cart/cubit/getCart_cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartCubit extends Cubit<CartState> {
  final ApiManager apiManager = ApiManager();

  CartCubit() : super(CartInitial());

  Future<void> getUserCart() async {
    emit(CartLoading());
    try {
      final cartResponse = await apiManager.getUserCart();
      emit(CartSuccess(cartResponse));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
