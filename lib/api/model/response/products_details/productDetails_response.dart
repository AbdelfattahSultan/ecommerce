class ProductDetailsResponse {
  final ProductDetails? productDetails;

  ProductDetailsResponse({this.productDetails});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      productDetails: json['data'] != null
          ? ProductDetails.fromJson(json['data'])
          : null,
    );
  }
}

class ProductDetails {
  final String? id;
  final int? sold;
  final List<String>? images;
  final List<SubCategoryModel>? subcategory;
  final int? ratingsQuantity;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final int? priceAfterDiscount;
  final String? imageCover;
  final CategoryModel? category;
  final BrandModel? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;

  ProductDetails({
    this.id,
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['id'],
      sold: json['sold'],
      images: (json['images'] as List?)?.map((e) => e.toString()).toList(),
      subcategory: (json['subcategory'] as List?)
          ?.map((e) => SubCategoryModel.fromJson(e))
          .toList(),
      ratingsQuantity: json['ratingsQuantity'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      priceAfterDiscount: json['priceAfterDiscount'],
      imageCover: json['imageCover'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      brand: json['brand'] != null
          ? BrandModel.fromJson(json['brand'])
          : null,
      ratingsAverage: json['ratingsAverage'] != null
          ? json['ratingsAverage'].toDouble()
          : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class CategoryModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  CategoryModel({this.id, this.name, this.slug, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

class BrandModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;

  BrandModel({this.id, this.name, this.slug, this.image});

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}

class SubCategoryModel {
  final String? id;
  final String? name;
  final String? slug;
  final String? category;

  SubCategoryModel({this.id, this.name, this.slug, this.category});

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }
}
