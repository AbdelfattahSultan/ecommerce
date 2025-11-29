class AddToCartResponse {
  final String status;
  final String message;
  final int numOfCartItems;
  final String cartId;
  final CartData data;

  AddToCartResponse({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      status: json["status"] ?? "",
      message: json["message"] ?? "",
      numOfCartItems: json["numOfCartItems"] ?? 0,
      cartId: json["cartId"] ?? "",
      data: CartData.fromJson(json["data"] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "message": message,
      "numOfCartItems": numOfCartItems,
      "cartId": cartId,
      "data": data.toJson(),
    };
  }
}

class CartData {
  final String id;
  final String cartOwner;
  final List<CartProduct> products;
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
          .map((e) => CartProduct.fromJson(e))
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

class CartProduct {
  final int count;
  final String id;
  final String product;
  final int price;

  CartProduct({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      count: json["count"] ?? 0,
      id: json["_id"] ?? "",
      product: json["product"] ?? "",
      price: json["price"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "count": count,
      "_id": id,
      "product": product,
      "price": price,
    };
  }
}
