import 'package:marketi/features/home/data/models/product_model.dart';

class CartItemModel {
  int? count;
  String? id;
  String? productId;
  ProductModel? product;
  int? price;

  CartItemModel({
    this.count,
    this.id,
    this.product,
    this.price,
    this.productId,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final productData = json['product'];

    return CartItemModel(
      count: json['count'] as int?,
      id: json['_id'] as String?,
      productId: productData is String ? productData : productData['_id'],
      product: productData is Map<String, dynamic>
          ? ProductModel.fromJson(productData)
          : null,
      price: json['price'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    '_id': id,
    'product': product?.toJson(),
    'price': price,
  };
}
