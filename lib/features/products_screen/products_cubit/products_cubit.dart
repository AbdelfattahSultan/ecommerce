import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/features/products_screen/products_cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ApiManager apiManager = ApiManager();
  ProductsCubit() : super(ProductsInitial());

  void getProductsByCategory(String categoryId) async {
  emit(ProductsLoading());
  try {
    var response = await apiManager.getProductsByCategory(categoryId);

    if (response.data == null || response.data!.isEmpty) {
      emit(ProductsEmpty("No products found for this category"));
    } else {
      emit(ProductsSuccess(response.data!));
    }

  } catch (e) {
    emit(ProductsError("Failed to fetch products"));
  }
}

}
