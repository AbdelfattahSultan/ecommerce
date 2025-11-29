import 'package:dio/dio.dart';
import 'package:ecommerce_app/api/model/response/BrandsResponse.dart';
import 'package:ecommerce_app/api/model/response/CategoriesResponse.dart';
import 'package:ecommerce_app/api/model/response/favorite_response/favorite_response.dart';
import 'package:ecommerce_app/api/model/response/products_details/productDetails_response.dart';
import 'package:ecommerce_app/api/model/response/products_respone/ProductsResponse.dart';
import 'package:ecommerce_app/api/model/response/register_respone/auth_response_model.dart';
import 'package:ecommerce_app/core/token/token.dart';
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

  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    var response = await _dio.post(
      "https://ecommerce.routemisr.com/api/v1/auth/signup",
      data: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": password,
        "phone": phone,
      },
    );
    var authResponseModel = AuthResponseModel.fromJson(response.data);
    return authResponseModel;
  }

  Future<AuthResponseModel> login(String email, String password) async {
    var response = await _dio.post(
      "https://ecommerce.routemisr.com/api/v1/auth/signin",
      data: {"email": email, "password": password},
    );
    var authResponseModel = AuthResponseModel.fromJson(response.data);
    return authResponseModel;
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

  Future<ProductsResponse> getProductsByBrand(String brandId) async {
    var response = await _dio.get(
      "https://ecommerce.routemisr.com/api/v1/products",
      queryParameters: {"brand": brandId},
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
    var token = await Token.getToken();
    var response = await _dio.post(
      "https://ecommerce.routemisr.com/api/v1/wishlist",
      data: {"productId": productsId},
      options: Options(
        headers: {"token": token ?? "", "Content-Type": "application/json"},
      ),
    );

    var favoriteResponse = FavoriteResponse.fromJson(response.data);
    return favoriteResponse;
  }

  Future<ProductsResponse> getAllFavProduct() async {
    var token = await Token.getToken();
    var response = await _dio.get(
      "https://ecommerce.routemisr.com/api/v1/wishlist",
      options: Options(
        headers: {"token": token ?? "", "Content-Type": "application/json"},
      ),
    );

    var productsResponse = ProductsResponse.fromJson(response.data);
    return productsResponse;
  }

  Future<bool> deleteProductFromFav(String productId) async {
    var token = await Token.getToken();
    final response = await _dio.delete(
      "https://ecommerce.routemisr.com/api/v1/wishlist/$productId",
      options: Options(
        headers: {"token": token ?? "", "Content-Type": "application/json"},
      ),
    );

    if (response.statusCode == 200 && response.data["status"] == "success") {
      return true;
    }

    return false;
  }
}
