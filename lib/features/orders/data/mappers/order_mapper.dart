import 'package:marketi/features/cart/data/mappers/cart_item_mapper.dart';
import 'package:marketi/features/orders/data/mappers/shipping_address_mapper.dart';
import 'package:marketi/features/orders/data/models/order_model.dart';
import 'package:marketi/features/orders/domain/entities/order_entity.dart';
import 'package:marketi/features/orders/domain/entities/shipping_address_entity.dart';

class OrderMapper {
  static OrderEntity mapToEntity(OrderModel model) {
    return OrderEntity(
      id: model.id ?? "",
      orderNumber: model.orderNumber ?? 0,
      shippingAddress: model.shippingAddress != null
          ? ShippingAddressMapper.mapToEntity(model.shippingAddress!)
          : ShippingAddressEntity(phone: "", city: "", details: ""),
      cartItems: model.cartItems
              ?.map((e) => CartItemMapper.mapToEntity(e))
              .toList() ??
          [],
      taxPrice: model.taxPrice ?? 0,
      shippingPrice: model.shippingPrice ?? 0,
      totalOrderPrice: model.totalOrderPrice ?? 0,
      paymentMethodType: model.paymentMethodType ?? "",
      isPaid: model.isPaid ?? false,
      isDelivered: model.isDelivered ?? false,
      createdAt: model.createdAt,
    );
  }
}
