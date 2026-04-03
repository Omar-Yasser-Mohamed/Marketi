import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/domain/entities/cart_item_entity.dart';

class CartItemMapper {
  static CartItemEntity mapToEntity(CartItemModel model) {
    return CartItemEntity(
      id: model.id ?? "",
      product: model.product!,
      count: model.count?.toInt() ?? 0,
      price: model.price?.toDouble() ?? 0,
    );
  }
}