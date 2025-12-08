import 'cart_item_model.dart';


class CartModel {
  String? cartId;
  String? cartOwner;
  List<CartItemModel>? cartProducts;
  DateTime? createdAt;
  DateTime? updatedAt;
  num? v;
  num? totalCartPrice;

  CartModel({
    this.cartId,
    this.cartOwner,
    this.cartProducts,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    cartId: json['_id'] as String?,
    cartOwner: json['cartOwner'] as String?,
    cartProducts: (json['products'] as List<dynamic>?)
        ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    v: json['__v'] as num?,
    totalCartPrice: json['totalCartPrice'] as num?,
  );

  Map<String, dynamic> toJson() => {
    '_id': cartId,
    'cartOwner': cartOwner,
    'products': cartProducts?.map((e) => e.toJson()).toList(),
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    '__v': v,
    'totalCartPrice': totalCartPrice,
  };
}
