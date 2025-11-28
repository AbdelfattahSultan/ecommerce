import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/brand_cubit/brand_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandCubit extends Cubit<BrandState> {
  final ApiManager apiManager = ApiManager();

  BrandCubit() : super(BrandInitial());

  void fetchBrands() async {
    emit(BrandLoading());
    try {
      final response = await apiManager.getBrands();
      emit(BrandsSuccess(response.data ?? []));
    } catch (e) {
      emit(BrandError("Failed to fetch brands"));
    }
  }
}
