import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final String id;
  final int orderNumber;
  final ShippingAddressEntity shippingAddress;
  final List<CartItemEntity> cartItems;
  final num taxPrice;
  final num shippingPrice;
  final num totalOrderPrice;
  final String paymentMethodType;
  final bool isPaid;
  final bool isDelivered;
  final DateTime? createdAt;

  OrderEntity({
    required this.id,
    required this.orderNumber,
    required this.shippingAddress,
    required this.cartItems,
    required this.taxPrice,
    required this.shippingPrice,
    required this.totalOrderPrice,
    required this.paymentMethodType,
    required this.isPaid,
    required this.isDelivered,
    this.createdAt,
  });
}
