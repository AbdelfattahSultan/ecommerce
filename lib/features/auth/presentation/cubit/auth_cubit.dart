import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/api/ApiManager.dart';
import 'package:ecommerce_app/api/model/response/register_respone/auth_response_model.dart';
import 'package:ecommerce_app/core/token/token.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiManager apiManager = ApiManager();

  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      AuthResponseModel response = await apiManager.login(email, password);

      Token.saveToken(response.token);
      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(AuthLoading());
    try {
      AuthResponseModel response = await apiManager.register(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );

      Token.saveToken(response.token);

      emit(AuthSuccess(response));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
