import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/cubit/favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavCubit extends Cubit<FavoriteState> {
  ApiManager apiManager = ApiManager();
  GetFavCubit() : super(FavoriteInitial());

  Future<void> getFavProducts() async {
    emit(FavoriteLoading());
    try {
      var response = await apiManager.getAllFavProduct();
      emit(FavoriteSuccess(response.data ?? []));

      if (response.data!.isEmpty || response.data == null) {
        emit(FavoriteEmpty());
      }
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
