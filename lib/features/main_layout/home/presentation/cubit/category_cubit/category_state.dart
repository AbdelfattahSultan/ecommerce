import 'package:ecommerce_app/api/model/category_dto.dart';


class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<CategoryDto> categories;
  
  CategorySuccess( this.categories);
}



class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
