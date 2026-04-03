import 'package:marketi/features/home/domain/entities/product_entity.dart';

class CartItemEntity {
  final String id;
  final ProductEntity product;
  final int count;
  final double price;

  CartItemEntity({
    required this.id,
    required this.product,
    required this.count,
    required this.price,
  });
}