import 'package:marketi/features/home/data/models/product_model.dart';

class CartItemModel {
  final String? id;
  final ProductModel? product;
  final num? count;
  final num? price;

  CartItemModel({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['_id'],
      product: json['product'] != null
          ? ProductModel.fromJson(json['product'])
          : null,
      count: json['count'],
      price: json['price'],
    );
  }
}
