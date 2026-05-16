import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'shipping_address_model.dart';

class OrderModel {
  final String? id;
  final int? orderNumber;
  final ShippingAddressModel? shippingAddress;
  final List<CartItemModel>? cartItems;
  final num? taxPrice;
  final num? shippingPrice;
  final num? totalOrderPrice;
  final String? paymentMethodType;
  final bool? isPaid;
  final bool? isDelivered;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderModel({
    this.id,
    this.orderNumber,
    this.shippingAddress,
    this.cartItems,
    this.taxPrice,
    this.shippingPrice,
    this.totalOrderPrice,
    this.paymentMethodType,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['_id'],
      orderNumber: json['id'],
      shippingAddress: json['shippingAddress'] != null
          ? ShippingAddressModel.fromJson(json['shippingAddress'])
          : null,
      cartItems: json['cartItems'] != null
          ? List<CartItemModel>.from(
              json['cartItems'].map((x) => CartItemModel.fromJson(x)),
            )
          : null,
      taxPrice: json['taxPrice'],
      shippingPrice: json['shippingPrice'],
      totalOrderPrice: json['totalOrderPrice'],
      paymentMethodType: json['paymentMethodType'],
      isPaid: json['isPaid'],
      isDelivered: json['isDelivered'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
    );
  }
}

