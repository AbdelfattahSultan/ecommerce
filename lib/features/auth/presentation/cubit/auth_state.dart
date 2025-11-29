import 'package:ecommerce_app/api/model/response/register_respone/auth_response_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthResponseModel authResponse;

  AuthSuccess(this.authResponse);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
