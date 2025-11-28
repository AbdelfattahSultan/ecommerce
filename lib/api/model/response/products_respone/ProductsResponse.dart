class ProductsResponse {
  int? results;
  ProductsMetadata? metadata;
  List<Product>? data;

  ProductsResponse({
    this.results,
    this.metadata,
    this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] != null
          ? ProductsMetadata.fromJson(json['metadata'])
          : null,
      data: json['data'] != null
          ? (json['data'] as List)
              .map((e) => Product.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'metadata': metadata?.toJson(),
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class ProductsMetadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  ProductsMetadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory ProductsMetadata.fromJson(Map<String, dynamic> json) {
    return ProductsMetadata(
      currentPage: json['currentPage'] as int?,
      numberOfPages: json['numberOfPages'] as int?,
      limit: json['limit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
    };
  }
}

class Product {
  num? sold;
  List<String>? images;
  List<ProductSubcategory>? subcategory;
  int? ratingsQuantity;
  String? internalId; // _id
  String? title;
  String? slug;
  String? description;
  int? quantity;
  num? price;
  num? priceAfterDiscount;
  String? imageCover;
  ProductCategory? category;
  ProductBrand? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;

  Product({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.internalId,
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
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    num? toNum(dynamic v) => v is num ? v : null;

    return Product(
      sold: toNum(json['sold']),
      images: json['images'] != null
          ? List<String>.from(json['images'] as List)
          : [],
      subcategory: json['subcategory'] != null
          ? (json['subcategory'] as List)
              .map((e) => ProductSubcategory.fromJson(e))
              .toList()
          : [],
      ratingsQuantity: json['ratingsQuantity'] as int?,
      internalId: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      quantity: json['quantity'] as int?,
      price: toNum(json['price']),
      priceAfterDiscount: toNum(json['priceAfterDiscount']),
      imageCover: json['imageCover'] as String?,
      category: json['category'] != null
          ? ProductCategory.fromJson(json['category'])
          : null,
      brand: json['brand'] != null
          ? ProductBrand.fromJson(json['brand'])
          : null,
      ratingsAverage: toNum(json['ratingsAverage']),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sold': sold,
      'images': images,
      'subcategory': subcategory?.map((e) => e.toJson()).toList(),
      'ratingsQuantity': ratingsQuantity,
      '_id': internalId,
      'title': title,
      'slug': slug,
      'description': description,
      'quantity': quantity,
      'price': price,
      'priceAfterDiscount': priceAfterDiscount,
      'imageCover': imageCover,
      'category': category?.toJson(),
      'brand': brand?.toJson(),
      'ratingsAverage': ratingsAverage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
    };
  }
}


class ProductSubcategory {
  String? id;
  String? name;
  String? slug;
  String? categoryId;

  ProductSubcategory({
    this.id,
    this.name,
    this.slug,
    this.categoryId,
  });

  factory ProductSubcategory.fromJson(Map<String, dynamic> json) {
    return ProductSubcategory(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      categoryId: json['category'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'category': categoryId,
    };
  }
}

class ProductCategory {
  String? id;
  String? name;
  String? slug;
  String? image;

  ProductCategory({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }
}

class ProductBrand {
  String? id;
  String? name;
  String? slug;
  String? image;

  ProductBrand({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  factory ProductBrand.fromJson(Map<String, dynamic> json) {
    return ProductBrand(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
    };
  }
}
