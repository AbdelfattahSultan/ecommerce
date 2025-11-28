import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/category_cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  ApiManager apiManager = ApiManager();
  CategoryCubit() : super(CategoryInitial());

  void fetchCategories() async {
    emit(CategoryLoading());
    try {
      var response = await apiManager.getCategories();

      emit(CategorySuccess(response.data ?? []));
    } catch (e) {
      emit(CategoryError("Failed to fetch categories"));
    }
  }


}
