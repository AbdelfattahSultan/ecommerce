import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  final ApiManager apiManager = ApiManager();

  DeleteCartCubit() : super(DeleteCartInitial());

  Future<void> deleteProduct(String productId) async {
    emit(DeleteCartLoading());
    try {
      final isDeleted = await apiManager.deleteProductFromCart(productId);
      if (isDeleted) {
        emit(DeleteCartSuccess());
      } else {
        emit(DeleteCartError("Failed to delete product from cart"));
      }
    } catch (e) {
      emit(DeleteCartError(e.toString()));
    }
  }
}
