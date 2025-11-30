class CartResponse {
  final String status;
  final int numOfCartItems;
  final String cartId;
  final CartData data;

  CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json["status"] ?? "",
      numOfCartItems: json["numOfCartItems"] ?? 0,
      cartId: json["cartId"] ?? "",
      data: CartData.fromJson(json["data"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "numOfCartItems": numOfCartItems,
      "cartId": cartId,
      "data": data.toJson(),
    };
  }
}

class CartData {
  final String id;
  final String cartOwner;
  final List<CartProductItem> products;
  final String createdAt;
  final String updatedAt;
  final int totalCartPrice;

  CartData({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.totalCartPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json["_id"] ?? "",
      cartOwner: json["cartOwner"] ?? "",
      products: (json["products"] as List<dynamic>? ?? [])
          .map((e) => CartProductItem.fromJson(e))
          .toList(),
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      totalCartPrice: json["totalCartPrice"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "cartOwner": cartOwner,
      "products": products.map((e) => e.toJson()).toList(),
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "totalCartPrice": totalCartPrice,
    };
  }
}

class CartProductItem {
  final int count;
  final String id;
  final CartProduct product;
  final int price;

  CartProductItem({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartProductItem.fromJson(Map<String, dynamic> json) {
    return CartProductItem(
      count: json["count"] ?? 0,
      id: json["_id"] ?? "",
      product: CartProduct.fromJson(json["product"] ?? {}),
      price: json["price"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "count": count,
      "_id": id,
      "product": product.toJson(),
      "price": price,
    };
  }
}

class CartProduct {
  final List<CartSubcategory> subcategory;
  final String id;
  final String title;
  final int quantity;
  final String imageCover;
  final CartCategory category;
  final CartBrand brand;
  final double ratingsAverage;
  final String productId;

  CartProduct({
    required this.subcategory,
    required this.id,
    required this.title,
    required this.quantity,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.productId,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      subcategory: (json["subcategory"] as List<dynamic>? ?? [])
          .map((e) => CartSubcategory.fromJson(e))
          .toList(),
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      quantity: json["quantity"] ?? 0,
      imageCover: json["imageCover"] ?? "",
      category: CartCategory.fromJson(json["category"] ?? {}),
      brand: CartBrand.fromJson(json["brand"] ?? {}),
      ratingsAverage:
          (json["ratingsAverage"] is int) ? (json["ratingsAverage"] as int).toDouble() : (json["ratingsAverage"] ?? 0.0).toDouble(),
      productId: json["id"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subcategory": subcategory.map((e) => e.toJson()).toList(),
      "_id": id,
      "title": title,
      "quantity": quantity,
      "imageCover": imageCover,
      "category": category.toJson(),
      "brand": brand.toJson(),
      "ratingsAverage": ratingsAverage,
      "id": productId,
    };
  }
}

class CartSubcategory {
  final String id;
  final String name;
  final String slug;
  final String category;

  CartSubcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  factory CartSubcategory.fromJson(Map<String, dynamic> json) {
    return CartSubcategory(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      category: json["category"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "slug": slug,
      "category": category,
    };
  }
}

class CartCategory {
  final String id;
  final String name;
  final String slug;
  final String image;

  CartCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory CartCategory.fromJson(Map<String, dynamic> json) {
    return CartCategory(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "slug": slug,
      "image": image,
    };
  }
}

class CartBrand {
  final String id;
  final String name;
  final String slug;
  final String image;

  CartBrand({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  factory CartBrand.fromJson(Map<String, dynamic> json) {
    return CartBrand(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      slug: json["slug"] ?? "",
      image: json["image"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "slug": slug,
      "image": image,
    };
  }
}
