import 'package:marketi/features/home/domain/entites/product_entity.dart';

class CartItemEntity {
  final ProductEntity product;
  final num count;
  final num price;

  CartItemEntity({
    required this.product,
    required this.count,
    required this.price,
  });
}
