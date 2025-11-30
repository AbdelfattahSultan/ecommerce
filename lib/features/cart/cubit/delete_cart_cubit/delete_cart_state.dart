abstract class DeleteCartState {}

class DeleteCartInitial extends DeleteCartState {}

class DeleteCartLoading extends DeleteCartState {}

class DeleteCartSuccess extends DeleteCartState {}

class DeleteCartError extends DeleteCartState {
  final String message;

  DeleteCartError(this.message);
}
