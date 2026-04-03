import 'package:marketi/features/cart/data/models/cart_item_model.dart';

class CartModel {
  final String? id;
  final String? cartOwner;
  final List<CartItemModel>? products;
  final int? totalCartPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CartModel({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.totalCartPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['_id'],
      cartOwner: json['cartOwner'],
      products: json['products'] != null
          ? List<CartItemModel>.from(
              json['products'].map((x) => CartItemModel.fromJson(x)),
            )
          : null,
      totalCartPrice: json['totalCartPrice'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }
}
