import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final String id;
  final String cartOwner;
  final List<CartItemEntity> products;
  final double totalCartPrice;

  CartEntity({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.totalCartPrice,
  });
}