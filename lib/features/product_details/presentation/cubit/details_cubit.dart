import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/features/product_details/presentation/cubit/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ApiManager apiManager = ApiManager();

  ProductDetailsCubit() : super(ProductDetailsInitial());

  Future<void> fetchProductDetails(String productId) async {
    try {
      emit(ProductDetailsLoading());

      final product = await apiManager.getProductsDetails(productId);

      emit(ProductDetailsSuccess(product.productDetails!));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }
}
