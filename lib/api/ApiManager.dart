import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/response/BrandsResponse.dart';
import 'package:ecommerce_app/api/model/response/CategoriesResponse.dart';
import 'package:ecommerce_app/api/model/response/favorite_response/favorite_response.dart';
import 'package:ecommerce_app/api/model/response/products_details/productDetails_response.dart';
import 'package:ecommerce_app/api/model/response/products_respone/ProductsResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class ApiManager {
  final _dio = Dio();

  ApiManager() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<CategoriesResponse> getCategories() async {
    var response = await _dio.get(
      "https://ecommerce.routemisr.com/api/v1/categories",
    );
    var categoriesResponse = CategoriesResponse.fromJson(response.data);
    return categoriesResponse;
  }

  Future<BrandsResponse> getBrands() async {
    var response = await _dio.get(
      "https://ecommerce.routemisr.com/api/v1/brands",
    );
    var brandsResponse = BrandsResponse.fromJson(response.data);
    return brandsResponse;
  }

  Future<ProductsResponse> getProductsByCategory(String categoryId) async {
    var response = await _dio.get(
      "https://ecommerce.routemisr.com/api/v1/products",
      queryParameters: {"category[in]": categoryId},
    );

    var productsResponse = ProductsResponse.fromJson(response.data);
    return productsResponse;
  }

  Future<ProductDetailsResponse> getProductsDetails(String productsId) async {
    var response = await _dio.get(
      "https://ecommerce.routemisr.com/api/v1/products/$productsId",
    );

    var productDetailsResponse = ProductDetailsResponse.fromJson(response.data);
    return productDetailsResponse;
  }

  Future<FavoriteResponse> addProductToFav(String productsId) async {
    var response = await _dio.post(
      "https://ecommerce.routemisr.com/api/v1/wishlist",
      data: {"productId": productsId},
      options: Options(
        headers: {
          "token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MjlmOGNiODRkOTUwYzkwMjM2YmVhYSIsIm5hbWUiOiJzdWx0YW4iLCJyb2xlIjoidXNlciIsImlhdCI6MTc2NDM1ODM0NywiZXhwIjoxNzcyMTM0MzQ3fQ.CyYsSlml-ljGZaXt-9lj9yRBJLs8228EMXXYQaUysLI",
          "Content-Type": "application/json",
        },
      ),
    );

    var favoriteResponse = FavoriteResponse.fromJson(response.data);
    return favoriteResponse;
  }
}
