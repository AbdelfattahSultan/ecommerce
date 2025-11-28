import 'package:ecommerce_app/api/model/response/brand_dto.dart';

abstract class BrandState {}

class BrandInitial extends BrandState {}

class BrandLoading extends BrandState {}

class BrandsSuccess extends BrandState {

  final List<BrandDto> brands;
  BrandsSuccess(this.brands);
}
class BrandError extends BrandState {
  final String message;

  BrandError(this.message);
}
