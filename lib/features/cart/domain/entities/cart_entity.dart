import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final String id;
  final List<CartItemEntity> products;
  final num numberOfItems;
  final num totalPrice;

  CartEntity({
    required this.id,
    required this.products,
    required this.numberOfItems,
    required this.totalPrice,
  });
}
